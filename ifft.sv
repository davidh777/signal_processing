module ifft (input logic CLK,
				 start,
				 RESET,
				 input logic [7:0] keycode,
				 input logic [11:0] sample,
				 output logic [11:0] addr,
				 output logic [31:0] q3,
				 output logic [31:0] d0);

	logic [31:0] data1,data2,q1,q2,data;
	logic [31:0] q4,da,db,twiddle;
	logic [11:0] addr1,addr2;
	logic w1,w2,read_mem,fft_done,m1;
	logic [10:0] ADDR_T;
	
	ram4096 input_ram (.data1(d0),
							  .addr1(addr),
							  .w(w1),
							  .Clk(CLK),
							  .q1(q1));
	
	ram4096 output_Ram (.data1(data),
								.addr1(addr),
								.w(w2),
								.Clk(CLK),
								.q1(q2));
	
	AGU AGU0 (.CLK(CLK),
				 .RESET(RESET),
				 .start(start),
				 .keycode(keycode),
				 .sample(sample),
				 .w1(w1),
				 .w2(w2),
				 .ADDR1(addr1),
				 .ADDR2(addr2),
				 .ADDR_T(ADDR_T),
				 .read_mem(read_mem),
				 .fft_done(fft_done));
	
	BFU BFU0 (.DINA(da),
				 .DINB(db),
				 .twiddle(twiddle),
				 .DOUTA(data1),
				 .DOUTB(data2));
	
	twiddle_factor_rom ROM0 (.addr_t(ADDR_T),.twiddle(twiddle));
	
	always_ff @(posedge CLK) begin
				if(read_mem == 1'b0) begin
					if(m1 == 1'b0)
						da <= q1;
					else
						db <= q2;
				end
	end
				

	always_comb begin

		if (m1 == 1'b0) begin
			addr = addr1;
			data = data1;
		end
		else begin 
			addr = addr2;
			data = data2;
		end
	
		if	(fft_done)
			d0 = 32'h0;
		else
			d0 = 32'h7fff7fff;
	end

endmodule
	