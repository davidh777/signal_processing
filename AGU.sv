module AGU (input logic CLK,
				input logic RESET,
				input logic start,
				input logic [7:0]keycode,
				input logic [11:0] sample,
				output logic m1,
				output logic w1,
				output logic w2,
				output logic [11:0] ADDR1,
				output logic [11:0] ADDR2,
				output logic [10:0] ADDR_T,
				output logic read_mem,
				output logic fft_done);	
				 
				logic [11:0] counter, counter2, a1, a2;
				logic wa,wb,w,c,c1;
				enum logic [4:0] {l0,l1,l2,l3,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,play} state, next_state;
				enum logic [2:0] {read, read2, compute, write1, write2, hold} lil_state, lil_next_state;
				
				times_2 A0 (counter, a1);
				
				always_ff @ (posedge CLK) begin
						lil_state <= read;
						if ( c == 1'b1 )
							lil_state <= lil_next_state;
						else 
							lil_state <= read;
	
						if (start == 1'b1)
							counter <= 11'b0;
						else
							counter <= counter + c1;						
						if (RESET == 1'b1)
							state <= play;
						else
							state <= next_state;
				end

				
				always_comb begin
					w1 = wa & w;
					w2 = wb & w;
					a2 = a1 + 1'b1;
					
					unique case (lil_state)
						read : lil_next_state = read2;
						read2 : lil_next_state = compute;
						compute : lil_next_state = write1;
						write1 : lil_next_state = write2;
						write2 : lil_next_state = hold;
						hold: lil_next_state = read;
					endcase
						
					unique case (state)
						l0 : next_state = l1;
						l1 : next_state = l2;
						l2 : next_state = l3;
						l3 : next_state = s0;
						s0 : begin 
							  if (counter == 12'h800)
								next_state = s1;
							  else
								next_state = s0;
					   end
						s1 : begin 
							  if (counter == 12'h800)
								next_state = s2;
							  else
								next_state = s1;
					   end
						s2 : begin 
							  if (counter == 12'h800)
								next_state = s3;
							  else
								next_state = s2;
					   end
						s3 : begin 
							  if (counter == 12'h800)
								next_state = s4;
							  else
								next_state = s3;
					   end
						s4 : begin 
							  if (counter == 12'h800)
								next_state = s5;
							  else
								next_state = s4;
					   end
						s5 : begin 
							  if (counter == 12'h800)
								next_state = s6;
							  else
								next_state = s5;
					   end
						s6 : begin 
							  if (counter == 12'h800)
								next_state = s7;
							  else
								next_state = s6;
					   end
						s7 : begin 
							  if (counter == 12'h800)
								next_state = s8;
							  else
								next_state = s7;
					   end
						s8 : begin 
							  if (counter == 12'h800)
								next_state = s9;
							  else
								next_state = s8;
					   end
						s9 : begin 
							  if (counter == 12'h800)
								next_state = s10;
							  else
								next_state = s9;
					   end
						s10 : begin 
							  if (counter == 12'h800)
								next_state = s11;
							  else
								next_state = s10;
					   end
						s11 : begin 
							  if (counter == 11'h800)
								next_state = play;
							  else
								next_state = s11;
					   end
						play : begin
								if (start == 1'b1)
									next_state = l0;
								else
									next_state = play;
						end
						default : next_state = play;
				endcase 
			
			case (lil_state)
				read : begin
					w = 1'b0;
					c1 = 1'b0;
					m1 = 1'b0;
				end
				read2 : begin
					w = 1'b0;
					c1 = 1'b0;
					m1 = 1'b1;
				end
				compute : begin
					w = 1'b0;
					c1 = 1'b0;
					m1 = 1'b1;
				end
				write1 : begin
					w = 1'b1;
					c1 = 1'b0;
					m1 = 1'b0;
				end
				write2 : begin
					w = 1'b1;
					c1 = 1'b0;
					m1 = 1'b1;
				end
				hold : begin
					w = 1'b0;
					c1 = 1'b1;
					m1 = 1'b0;
				end
				default 	begin
					w = 1'b0;
					c1 = 1'b0;
					m1 = 1'b0;
				end
			endcase
			
			case (state)
				l0 : begin
					wa = 1'b1;
					wb = 1'b0;
					read_mem = 1'b0;
					fft_done = 1'b0;
					ADDR1 = 12'h02C;
					ADDR2 = 12'hFD4;
					c = 1'b0;
					ADDR_T = 1'b0;
				end
				l1 : begin
					wa = 1'b0;
					wb = 1'b0;
					read_mem = 1'b0;
					fft_done = 1'b0;
					ADDR1 = 12'b0;
					ADDR2 = 12'b0;
					c = 1'b0;
					ADDR_T = 1'b0;
				end
				l2 : begin
					wa = 1'b0;
					wb = 1'b0;
					read_mem = 1'b0;
					fft_done = 1'b0;
					ADDR1 = 12'b0;
					ADDR2 = 12'b0;
					c = 1'b0;
					ADDR_T = 1'b0;
				end
				l3 : begin
					wa = 1'b0;
					wb = 1'b0;
					read_mem = 1'b0;
					fft_done = 1'b0;
					ADDR1 = 12'b0;
					ADDR2 = 12'b0;
					c = 1'b0;
					ADDR_T = 1'b0;
				end
				s0 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b0;
					fft_done = 1'b0;
					ADDR1 = a1;
					ADDR2 = a2;
					c = 1'b1;
					ADDR_T = 10'b0000000000;
				end
				s1 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<1)|(a1>>10));
					ADDR2 = ((a2<<1)|(a2>>10));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 1 ) & 10'b1111111111 )&counter;
				end
				s2 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<2)|(a1>>9));
					ADDR2 = ((a2<<2)|(a2>>9));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 2 ) & 10'b1111111111 )&counter;
				end
				s3 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<3)|(a1>>8));
					ADDR2 = ((a2<<3)|(a2>>8));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 3 ) & 10'b1111111111 ) & counter;
				end
				s4 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<4)|(a1>>7));
					ADDR2 = ((a2<<4)|(a2>>7));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 4 ) & 10'b1111111111 )&counter;
				end
				s5 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<5)|(a1>>6));
					ADDR2 = ((a2<<5)|(a2>>6));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 5 ) & 10'b1111111111 )&counter;
				end
				s6 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<6)|(a1>>5));
					ADDR2 = ((a2<<6)|(a2>>5));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 6 ) & 10'b1111111111 )&counter;
				end
				s7 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<7)|(a1>>4));
					ADDR2 = ((a2<<7)|(a2>>4));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 7 ) & 10'b1111111111 )&counter;
				end
				s8 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<8)|(a1>>3));
					ADDR2 = ((a2<<8)|(a2>>3));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 8 ) & 10'b1111111111 ) & counter;
				end
				s9 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<9)|(a1>>2));
					ADDR2 = ((a2<<9)|(a2>>2));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 9 ) & 10'b1111111111 )&counter;
				end
				s10 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<10)|(a1>>1));
					ADDR2 = ((a2<<10)|(a2>>1));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 10 ) & 10'b1111111111 )&counter;
				end
				s11 : begin
					wa = 1'b0;
					wb = 1'b1;
					read_mem = 1'b1;
					fft_done = 1'b0;
					ADDR1 = ((a1<<11)|(a1));
					ADDR2 = ((a2<<11)|(a2));
					c = 1'b1;
					ADDR_T =  ( ( 32'hfffffc00 >> 11 ) & 10'b1111111111 )&counter;
				end
				play : begin
					wa = 1'b1;
					wb = 1'b0;
					read_mem = 1'b1;
					fft_done = 1'b1;
					ADDR1 = sample;
					ADDR2 = 12'b0;
					c = 1'b0;
					ADDR_T = 1'b0;
				end
				default begin 
					wa = 1'b0;
					wb = 1'b0;
					read_mem = 1'b0;
					fft_done = 1'b0;
					ADDR1 = 12'b0;
					ADDR2 = 12'b0;
					c = 1'b0;
					ADDR_T = 1'b0;
				end
			endcase
		end	
endmodule

module times_2(input logic [11:0] data, output logic [11:0] data2);
	always_comb begin
	data2[11:1] = data[10:0];
	data2[0] = 1'b0;
	end
endmodule
