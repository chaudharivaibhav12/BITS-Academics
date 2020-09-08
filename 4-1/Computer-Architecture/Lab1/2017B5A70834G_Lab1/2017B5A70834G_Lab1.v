//ShifterAndALU.v

// select 0 = in0 1 = in1
module mux2to1_3bit(input [2:0] in0, input [2:0] in1, input select, output reg [2:0] muxOut);
  //WRITE CODE HERE

	always @(in0 or in1 or select)
		 if (select == 1'b0)
				 muxOut = in0;
		 else if(select == 1'b1)
				 muxOut = in1;
		 else if(select == 1'bx)
			   muxOut=3'bxxx;

endmodule

// select 0 = in0 1 = in1
module mux2to1_8bit(input [7:0] in0, input [7:0] in1, input select, output reg [7:0] muxOut);
   //WRITE CODE HERE

	 always @(in0 or in1 or select)
 		 if (select == 1'b0)
 				 muxOut = in0;
 		 else if(select == 1'b1)
 				 muxOut = in1;
		 else if(select == 1'bx)
			   muxOut=8'bxxxxxxxx;

endmodule


module mux8to1_1bit(input in0, input in1, input in2, input in3, input in4, input in5, input in6, input in7, input[2:0] select,output reg muxOut);
   //WRITE CODE HERE

	 always @(in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or select)
 		 if (select == 3'd0)
 				 muxOut = in0;
 		 else if (select == 3'd1)
 				 muxOut = in1;
		 else if (select == 3'd2)
	 			 muxOut = in2;
		 else if (select == 3'd3)
 				 muxOut = in3;
		 else if (select == 3'd4)
	 			 muxOut = in4;
		 else if (select == 3'd5)
 		  	 muxOut = in5;
 		 else if (select == 3'd6)
 				 muxOut = in6;
 		 else if (select == 3'd7)
		 		 muxOut = in7;
		 else if (select == 3'bxxx)
		 		 muxOut = 1'bx;


endmodule

module barrelshifter(input[2:0] shiftAmt, input[7:0] b, input[2:0] oper, output[7:0] shiftOut);
	   //WRITE CODE HERE

		 wire  [2:0] muxAout, muxBout, muxCout;
		 wire  [7:0] t, q;

		 mux2to1_3bit muxA(3'd0, oper, shiftAmt[0], muxAout);
		 mux2to1_3bit muxB(3'd0, oper, shiftAmt[1], muxBout);
		 mux2to1_3bit muxC(3'd0, oper, shiftAmt[2], muxCout);

		 mux8to1_1bit muxA0(b[0], b[1], b[1], b[1], 1'd0, b[7], 1'd0, 1'd0, muxAout, t[0]);
		 mux8to1_1bit muxA1(b[1], b[2], b[2], b[2], b[0], b[0], 1'd0, 1'd0, muxAout, t[1]);
		 mux8to1_1bit muxA2(b[2], b[3], b[3], b[3], b[1], b[1], 1'd0, 1'd0, muxAout, t[2]);
		 mux8to1_1bit muxA3(b[3], b[4], b[4], b[4], b[2], b[2], 1'd0, 1'd0, muxAout, t[3]);
		 mux8to1_1bit muxA4(b[4], b[5], b[5], b[5], b[3], b[3], 1'd0, 1'd0, muxAout, t[4]);
		 mux8to1_1bit muxA5(b[5], b[6], b[6], b[6], b[4], b[4], 1'd0, 1'd0, muxAout, t[5]);
		 mux8to1_1bit muxA6(b[6], b[7], b[7], b[7], b[5], b[5], 1'd0, 1'd0, muxAout, t[6]);
		 mux8to1_1bit muxA7(b[7], b[7], 1'd0, b[0], b[6], b[6], 1'd0, 1'd0, muxAout, t[7]);

	 	 mux8to1_1bit muxB0(t[0], t[2], t[2], t[2], 1'd0, t[6], 1'd0, 1'd0, muxBout, q[0]);
		 mux8to1_1bit muxB1(t[1], t[3], t[3], t[3], 1'd0, t[7], 1'd0, 1'd0, muxBout, q[1]);
		 mux8to1_1bit muxB2(t[2], t[4], t[4], t[4], t[0], t[0], 1'd0, 1'd0, muxBout, q[2]);
		 mux8to1_1bit muxB3(t[3], t[5], t[5], t[5], t[1], t[1], 1'd0, 1'd0, muxBout, q[3]);
		 mux8to1_1bit muxB4(t[4], t[6], t[6], t[6], t[2], t[2], 1'd0, 1'd0, muxBout, q[4]);
		 mux8to1_1bit muxB5(t[5], t[7], t[7], t[7], t[3], t[3], 1'd0, 1'd0, muxBout, q[5]);
		 mux8to1_1bit muxB6(t[6], t[7], 1'd0, t[0], t[4], t[4], 1'd0, 1'd0, muxBout, q[6]);
		 mux8to1_1bit muxB7(t[7], t[7], 1'd0, t[1], t[5], t[5], 1'd0, 1'd0, muxBout, q[7]);

		 mux8to1_1bit muxC0(q[0], q[4], q[4], q[4], 1'd0, q[4], 1'd0, 1'd0, muxCout, shiftOut[0]);
		 mux8to1_1bit muxC1(q[1], q[5], q[5], q[5], 1'd0, q[5], 1'd0, 1'd0, muxCout, shiftOut[1]);
		 mux8to1_1bit muxC2(q[2], q[6], q[6], q[6], 1'd0, q[6], 1'd0, 1'd0, muxCout, shiftOut[2]);
		 mux8to1_1bit muxC3(q[3], q[7], q[7], q[7], 1'd0, q[7], 1'd0, 1'd0, muxCout, shiftOut[3]);
		 mux8to1_1bit muxC4(q[4], q[7], 1'd0, q[0], q[0], q[0], 1'd0, 1'd0, muxCout, shiftOut[4]);
		 mux8to1_1bit muxC5(q[5], q[7], 1'd0, q[1], q[1], q[1], 1'd0, 1'd0, muxCout, shiftOut[5]);
		 mux8to1_1bit muxC6(q[6], q[7], 1'd0, q[2], q[2], q[2], 1'd0, 1'd0, muxCout, shiftOut[6]);
		 mux8to1_1bit muxC7(q[7], q[7], 1'd0, q[3], q[3], q[3], 1'd0, 1'd0, muxCout, shiftOut[7]);


endmodule

// Alu operations are: 00 for alu1, 01 for add, 10 for sub(alu1-alu2) , 11 for AND, 100 for OR and 101 for NOT(alu1)
module alu(input [7:0] aluIn1, input [7:0] aluIn2, input [2:0]aluOp, output reg [7:0] aluOut);
       //WRITE CODE HERE
			 always@(aluIn1 or aluIn2 or aluOp)
					if (aluOp == 3'b000)
							aluOut = aluIn1;
					else if (aluOp == 3'b001)
							aluOut = aluIn1 + aluIn2;
					else if (aluOp == 3'b010)
							aluOut = aluIn1 - aluIn2;
					else if (aluOp == 3'b011)
							aluOut = aluIn1 & aluIn2;
					else if (aluOp == 3'b100)
							aluOut = aluIn1 | aluIn2;
					else if (aluOp == 3'b101)
							aluOut = ~aluIn1;



endmodule


module shifterAndALU(input [7:0]inp1, input [7:0] inp2, input [2:0]shiftlmm, input selShiftAmt, input [2:0]oper, input selOut, output [7:0] out);
	   //WRITE CODE HERE

		 wire [7:0] aluOutput, shiftOutput;
		 wire [2:0] shiftAmount;

		 mux2to1_3bit muxShiftAmount(inp2 [2:0], shiftlmm, selShiftAmt, shiftAmount);
 		 barrelshifter barrelShifter(shiftAmount, inp1, oper, shiftOutput);
		 alu Alu(inp1, inp2, oper, aluOutput);
 		 mux2to1_8bit muxSelectOutput(aluOutput, shiftOutput, selOut, out);

endmodule

//TestBench ALU
module testbenchALU();
	// Input
	reg [7:0] inp1, inp2;
	reg [2:0] aluOp;
	reg [2:0] shiftlmm;
	reg selShiftAmt, selOut;
	// Output
	wire [7:0] aluOut;

	shifterAndALU shifterAndALU_Test (inp1, inp2, shiftlmm, selShiftAmt, aluOp, selOut, aluOut);

	initial
		begin
			$dumpfile("testALU.vcd");
     	$dumpvars(0,testbenchALU);
			inp1 = 8'd80; //80 in binary is 1010000
			inp2 = 8'd20; //20 in binary is 10100
			shiftlmm = 3'b010;

			aluOp=3'd0; selOut = 1'b0;// normal output = 80

			#10 aluOp = 3'd0; selOut = 1'b1; selShiftAmt = 1'b1; //No shift output = 80

			#10 aluOp=3'd1; selOut = 1'b0;// normal add	output => 20 + 80 = 100

			#10 aluOp = 3'd1; selOut = 1'b1; selShiftAmt = 1'b1; // arithmetic shift right of 80 by 2 places = 20

			#10 aluOp=3'd2; selOut = 1'b0; // normal sub output => 80 - 20 = 60

			#10 aluOp = 3'd2; selOut = 1'b1; selShiftAmt = 1'b0; // logical shift right of 80 by 4 places = 0

			#10 aluOp=3'd3; selOut = 1'b0;// normal and output => 80 & 20 = 16

			#10 aluOp = 3'd3; selOut = 1'b1; selShiftAmt = 1'b0; // Circular Shift Right of 80 by 4 places = 5

			#10 aluOp=3'd4; selOut = 1'b0;// normal or output => 80 | 20 = 84

			#10 aluOp = 3'd4; selOut = 1'b1; selShiftAmt = 1'b1; // Logical Shift Left of 80 by 2 bits = 64

			#10 aluOp=3'd5; selOut = 1'b0; // normal not of 80 = 175

			#10 aluOp = 3'd5; selOut = 1'b1; selShiftAmt = 1'b0; // Circular left shift of 80 by 4 bits = 5

			#10 inp1=8'd15; inp2=8'd26; aluOp=3'd2; selOut = 1'b0;//sub overflow
			// (15 - 26) = -11 and its a 8 bit number so, 256-11 = 245 output => 245 (since it is unsigned decimal)

			#10 inp1=8'd150; inp2=8'd150; aluOp=3'd1; selOut = 1'b0;// add overflow
			//(150+150) = 300 and its a 8 bit number so, 300-256 = 44 output=> 44.

			#10 inp1=8'b0000_0000; aluOp=3'd5; selOut = 1'b0;//not overflow
			// not(0) = all 1. Since its a 8 bit number output=>255

			#10 $finish;
		end

endmodule
