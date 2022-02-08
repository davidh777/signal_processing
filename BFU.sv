module BFU (input logic [31:0] DINA,
				input logic [31:0] DINB,
				input logic [31:0] twiddle,
				output logic [31:0] DOUTA,
				output logic [31:0] DOUTB);
				
				
				logic [15:0] realA,realB,realt,imA,imb,imt;
				logic [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,BR,BI;
				logic [31:0] i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15, c;
				and_bit u0 (.word(realB),.bi(realt[0]),.next(r0[14:0]));
				and_bit u1 (.word(realB),.bi(realt[1]),.next(r1[15:1]));
				and_bit u2 (.word(realB),.bi(realt[2]),.next(r2[16:2]));
				and_bit u3 (.word(realB),.bi(realt[3]),.next(r3[17:3]));
				and_bit u4 (.word(realB),.bi(realt[4]),.next(r4[18:4]));
				and_bit u5 (.word(realB),.bi(realt[5]),.next(r5[19:5]));
				and_bit u6 (.word(realB),.bi(realt[6]),.next(r6[20:6]));
				and_bit u7 (.word(realB),.bi(realt[7]),.next(r7[21:7]));
				and_bit u8 (.word(realB),.bi(realt[8]),.next(r8[22:8]));
				and_bit u9 (.word(realB),.bi(realt[9]),.next(r9[23:9]));
				and_bit u10 (.word(realB),.bi(realt[10]),.next(r10[24:10]));
				and_bit u11 (.word(realB),.bi(realt[11]),.next(r11[25:11]));
				and_bit u12 (.word(realB),.bi(realt[12]),.next(r12[26:12]));
				and_bit u13 (.word(realB),.bi(realt[13]),.next(r13[27:13]));
				and_bit u14 (.word(realB),.bi(realt[14]),.next(r14[28:14]));
				and_bit u15 (.word(realB),.bi(realt[15]),.next(r15[29:15]));
				
				and_bit u16 (.word(imb),.bi(imt[0]),.next(i0[14:0]));
				and_bit u17 (.word(imb),.bi(imt[1]),.next(i1[15:1]));
				and_bit u18 (.word(imb),.bi(imt[2]),.next(i2[16:2]));
				and_bit u19 (.word(imb),.bi(imt[3]),.next(i3[17:3]));
				and_bit u20 (.word(imb),.bi(imt[4]),.next(i4[18:4]));
				and_bit u21 (.word(imb),.bi(imt[5]),.next(i5[19:5]));
				and_bit u22 (.word(imb),.bi(imt[6]),.next(i6[20:6]));
				and_bit u23 (.word(imb),.bi(imt[7]),.next(i7[21:7]));
				and_bit u24 (.word(imb),.bi(imt[8]),.next(i8[22:8]));
				and_bit u25 (.word(imb),.bi(imt[9]),.next(i9[23:9]));
				and_bit u26 (.word(imb),.bi(imt[10]),.next(i10[24:10]));
				and_bit u27 (.word(imb),.bi(imt[11]),.next(i11[25:11]));
				and_bit u28 (.word(imb),.bi(imt[12]),.next(i12[26:12]));
				and_bit u29 (.word(imb),.bi(imt[13]),.next(i13[27:13]));
				and_bit u30 (.word(imb),.bi(imt[14]),.next(i14[28:14]));
				and_bit u31 (.word(imb),.bi(imt[15]),.next(i15[29:15]));
				
				addf a0 (.A(DINA[31:16]),.B(BR[31:16]),.c(DOUTA[31:16]));
				addf a1 (.A(BI[31:16]),.B(DINA[15:0]),.c(DOUTA[15:0]));
				addf a2 (.A(DINA[31:16]),.B(c[31:16]),.c(DOUTB[31:16]));
				addf a3 (.A(DINA[15:0]),.B(c[15:0]),.c(DOUTB[15:0]));
				
				always_comb begin
					realB = DINB[31:16];
					realt = twiddle[31:16];
					imb = DINB[15:0];
					imt = twiddle[15:0];

					r0[31:15] = 17'b0;
					r1[31:16] = 16'b0;
					r1[0] = 1'b0;
					r2[31:17] = 15'b0;
					r2[1:0] = 2'b0;
					r3[31:18] = 14'b0;
					r3[2:0] = 3'b0;
					r4[31:19] = 13'b0;
					r4[3:0] = 4'b0;
					r5[31:20] = 12'b0;
					r5[4:0] = 5'b0;
					r6[31:21] = 11'b0;
					r6[5:0] = 6'b0;
					r7[31:22] = 10'b0;
					r7[6:0] = 7'b0;
					r8[31:23] = 9'b0;
					r8[7:0] = 8'b0;
					r9[31:24] = 8'b0;
					r9[8:0] = 9'b0;
					r10[31:25] = 7'b0;
					r10[9:0] = 10'b0;
					r11[31:26] = 6'b0;
					r11[10:0] = 11'b0;
					r12[31:27] = 5'b0;
					r12[11:0] = 12'b0;
					r13[31:28] = 4'b0;
					r13[12:0] = 13'b0;
					r14[31:29] = 3'b0;
					r14[13:0] = 14'b0;
					r15[31:30] = 2'b0;
					r15[14:0] = 15'b0;

					i0[31:15] = 17'b0;
					i1[31:16] = 16'b0;
					i1[0] = 1'b0;
					i2[31:17] = 15'b0;
					i2[1:0] = 2'b0;
					i3[31:18] = 14'b0;
					i3[2:0] = 3'b0;
					i4[31:19] = 13'b0;
					i4[3:0] = 4'b0;
					i5[31:20] = 12'b0;
					i5[4:0] = 5'b0;
					i6[31:21] = 11'b0;
					i6[5:0] = 6'b0;
					i7[31:22] = 10'b0;
					i7[6:0] = 7'b0;
					i8[31:23] = 9'b0;
					i8[7:0] = 8'b0;
					i9[31:24] = 8'b0;
					i9[8:0] = 9'b0;
					i10[31:25] = 7'b0;
					i10[9:0] = 10'b0;
					i11[31:26] = 6'b0;
					i11[10:0] = 11'b0;
					i12[31:27] = 5'b0;
					i12[11:0] = 12'b0;
					i13[31:28] = 4'b0;
					i13[12:0] = 13'b0;
					i14[31:29] = 3'b0;
					i14[13:0] = 14'b0;
					i15[31:30] = 2'b0;
					i15[14:0] = 15'b0;
					
			
					BR[30:0] = (r0+r1+r2+r3+r4+r5+r6+r7+r8+r9+r10+r11+r12+r13+r14+r15);
					BI[30:0] = (i0+i1+i2+i3+i4+i5+i6+i7+i8+i9+i10+i11+i12+i13+i14+i15);
					BR[31] = realB[15]^realt[15];
					BI[31] = imb[15]^imt[15];
					c[30:16] = BR[30:16];
					c[31] = ~BR[31];
					c[14:0] = BI[30:16];
					c[15] = ~BI[31];
					//DOUTA[31:16] = BR[31:16] + DINA[31:16];
					//DOUTA[15:0] = BI[31:16] + DINA[15:0];
					//DOUTB[31:16] = DINA[31:16] - BR[31:16];
					//DOUTB[15:0] =  DINA[15:0] - BI[31:16];

				end
endmodule


module and_bit(input logic [15:0] word, input logic bi, output logic [15:0] next); 

				always_comb begin
					next[0] = word[0] & bi;
					next[1] = word[1] & bi;
					next[2] = word[2] & bi;
					next[3] = word[3] & bi;
					next[4] = word[4] & bi;
					next[5] = word[5] & bi;
					next[6] = word[6] & bi;
					next[7] = word[7] & bi;
					next[8] = word[8] & bi;
					next[9] = word[9] & bi;
					next[10] = word[10] & bi;
					next[11] = word[11] & bi;
					next[12] = word[12] & bi;
					next[13] = word[13] & bi;
					next[14] = word[14] & bi;
					next[15] = word[15] & bi;
				end
endmodule 

module addf (input logic [15:0] A, input logic [15:0] B, output logic [15:0] c);
	logic [15:0] temp,tempa,tempb;
		always_comb begin
			if(A[15] == 1'b0)
				tempa = A;
			else 
				tempa = ~A + 1'b1;
			if(B[15] == 1'b0)
				tempb = B;
			else
				tempb = ~B + 1'b1;
			temp = tempa + tempb;
			if ( (A[15] == 1'b0) & (B[15] == 1'b0) & (temp[15] == 1'b1) )
				c = 16'h7fff;
			else if ( (A[15] == 1'b1) & (B[15] == 1'b1) & (temp[15] == 1'b0) )
				c = 16'h8001;
			else if ( (temp[15] == 1'b1) & ((A[15] == 1'b1) ^ (B[15] == 1'b1)) ) begin
				c[15] = 1'b1;
				c[14:0] = ~temp[14:0] + 1'b1;
			end
			else
				c = temp;
			end
endmodule 

				
			