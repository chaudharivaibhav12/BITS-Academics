module D_ff( input clk, input reset, input regWrite, input decOut1b , input d, output reg q);
    always @ (negedge clk)
    begin
    if(reset==1)
        q=0;
    else
        if(regWrite == 1 && decOut1b==1)
        begin
            q=d;
        end
    end
endmodule

//D flip flip for Instruction Memory
module D_ff_IM(input clk, input reset, input d, output reg q);
	always@(reset or posedge clk)
	if(reset)
		q=d;
endmodule


// select 0 = in0 1 = in1
module mux2to1_5bit(input [4:0] in0, input [4:0] in1, input select, output reg [4:0] muxOut);
  always@(in0 or in1 or select)
  begin
    if(select == 1'b0)
      muxOut = in0;
	  else if(select == 1'b1)
      muxOut = in1;
  end
endmodule

// select 0 = in0 1 = in1
module mux2to1_32bit(input [31:0] in0, input [31:0] in1, input select, output reg [31:0] muxOut);
  always@(in0 or in1 or select)
  begin
    if(select == 1'b0)
      muxOut = in0;
	  else if(select == 1'b1)
      muxOut = in1;
  end
endmodule

module mux32to1_32bit(input[31:0] in0, input[31:0] in1, input[31:0] in2, input[31:0] in3, input[31:0] in4, input[31:0] in5, input[31:0] in6, input[31:0] in7,
    input[31:0] in8, input[31:0] in9, input[31:0] in10, input[31:0] in11, input[31:0] in12, input[31:0] in13, input[31:0] in14, input[31:0] in15,
    input[31:0] in16, input[31:0] in17, input[31:0] in18, input[31:0] in19, input[31:0] in20, input[31:0] in21, input[31:0] in22, input[31:0] in23,
    input[31:0] in24, input[31:0] in25, input[31:0] in26, input[31:0] in27, input[31:0] in28, input[31:0] in29, input[31:0] in30, input[31:0] in31,input[4:0] select,output reg[31:0] muxOut);

   always@(in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or in10 or in11 or in12
      or in13 or in14 or in15 or in16 or in17 or in18 or in19 or in20 or in21 or in22 or in23 or in24
       or in25 or in26 or in27 or in28 or in29 or in30 or in31 or select)
   begin
      case(select)
        5'b00000: begin muxOut = in0; end
        5'b00001: begin muxOut = in1; end
        5'b00010: begin muxOut = in2; end
        5'b00011: begin muxOut = in3; end
        5'b00100: begin muxOut = in4; end
        5'b00101: begin muxOut = in5; end
        5'b00110: begin muxOut = in6; end
        5'b00111: begin muxOut = in7; end
        5'b01000: begin muxOut = in8; end
        5'b01001: begin muxOut = in9; end
        5'b01010: begin muxOut = in10; end
        5'b01011: begin muxOut = in11; end
        5'b01100: begin muxOut = in12; end
        5'b01101: begin muxOut = in13; end
        5'b01110: begin muxOut = in14; end
        5'b01111: begin muxOut = in15; end
        5'b10000: begin muxOut = in16; end
        5'b10001: begin muxOut = in17; end
        5'b10010: begin muxOut = in18; end
        5'b10011: begin muxOut = in19; end
        5'b10100: begin muxOut = in20; end
        5'b10101: begin muxOut = in21; end
        5'b10110: begin muxOut = in22; end
        5'b10111: begin muxOut = in23; end
        5'b11000: begin muxOut = in24; end
        5'b11001: begin muxOut = in25; end
        5'b11010: begin muxOut = in26; end
        5'b11011: begin muxOut = in27; end
        5'b11100: begin muxOut = in28; end
        5'b11101: begin muxOut = in29; end
        5'b11110: begin muxOut = in30; end
        5'b11111: begin muxOut = in31; end
      endcase
    end
endmodule

// mux to be used in Instruction Memory and Data Memory
module mux128to1_IM_DM(input [7:0] in0,   input [7:0] in1,   input [7:0] in2,   input [7:0] in3,
                    input [7:0] in4,   input [7:0] in5,   input [7:0] in6,   input [7:0] in7,
                    input [7:0] in8,   input [7:0] in9,   input [7:0] in10,  input [7:0] in11,
                    input [7:0] in12,  input [7:0] in13,  input [7:0] in14,  input [7:0] in15,
                    input [7:0] in16,  input [7:0] in17,  input [7:0] in18,  input [7:0] in19,
                    input [7:0] in20,  input [7:0] in21,  input [7:0] in22,  input [7:0] in23,
                    input [7:0] in24,  input [7:0] in25,  input [7:0] in26,  input [7:0] in27,
                    input [7:0] in28,  input [7:0] in29,  input [7:0] in30,  input [7:0] in31,
                    input [7:0] in32,  input [7:0] in33,  input [7:0] in34,  input [7:0] in35,
                    input [7:0] in36,  input [7:0] in37,  input [7:0] in38,  input [7:0] in39,
                    input [7:0] in40,  input [7:0] in41,  input [7:0] in42,  input [7:0] in43,
                    input [7:0] in44,  input [7:0] in45,  input [7:0] in46,  input [7:0] in47,
                    input [7:0] in48,  input [7:0] in49,  input [7:0] in50,  input [7:0] in51,
                    input [7:0] in52,  input [7:0] in53,  input [7:0] in54,  input [7:0] in55,
                    input [7:0] in56,  input [7:0] in57,  input [7:0] in58,  input [7:0] in59,
                    input [7:0] in60,  input [7:0] in61,  input [7:0] in62,  input [7:0] in63,
                    input [7:0] in64,  input [7:0] in65,  input [7:0] in66,  input [7:0] in67,
                    input [7:0] in68,  input [7:0] in69,  input [7:0] in70,  input [7:0] in71,
                    input [7:0] in72,  input [7:0] in73,  input [7:0] in74,  input [7:0] in75,
                    input [7:0] in76,  input [7:0] in77,  input [7:0] in78,  input [7:0] in79,
                    input [7:0] in80,  input [7:0] in81,  input [7:0] in82,  input [7:0] in83,
                    input [7:0] in84,  input [7:0] in85,  input [7:0] in86,  input [7:0] in87,
                    input [7:0] in88,  input [7:0] in89,  input [7:0] in90,  input [7:0] in91,
                    input [7:0] in92,  input [7:0] in93,  input [7:0] in94,  input [7:0] in95,
                    input [7:0] in96,  input [7:0] in97,  input [7:0] in98,  input [7:0] in99,
                    input [7:0] in100, input [7:0] in101, input [7:0] in102, input [7:0] in103,
                    input [7:0] in104, input [7:0] in105, input [7:0] in106, input [7:0] in107,
                    input [7:0] in108, input [7:0] in109, input [7:0] in110, input [7:0] in111,
                    input [7:0] in112, input [7:0] in113, input [7:0] in114, input [7:0] in115,
                    input [7:0] in116, input [7:0] in117, input [7:0] in118, input [7:0] in119,
                    input [7:0] in120, input [7:0] in121, input [7:0] in122, input [7:0] in123,
                    input [7:0] in124, input [7:0] in125, input [7:0] in126, input [7:0] in127,
                    input [4:0] select, output reg [31:0] muxOut);
    always@(in0,   in1,   in2,   in3,   in4,   in5,   in6,   in7,
            in8,   in9,   in10,  in11,  in12,  in13,  in14,  in15,
            in16,  in17,  in18,  in19,  in20,  in21,  in22,  in23,
            in24,  in25,  in26,  in27,  in28,  in29,  in30,  in31,
            in32,  in33,  in34,  in35,  in36,  in37,  in38,  in39,
            in40,  in41,  in42,  in43,  in44,  in45,  in46,  in47,
            in48,  in49,  in50,  in51,  in52,  in53,  in54,  in55,
            in56,  in57,  in58,  in59,  in60,  in61,  in62,  in63,
            in64,  in65,  in66,  in67,  in68,  in69,  in70,  in71,
            in72,  in73,  in74,  in75,  in76,  in77,  in78,  in79,
            in80,  in81,  in82,  in83,  in84,  in85,  in86,  in87,
            in88,  in89,  in90,  in91,  in92,  in93,  in94,  in95,
            in96,  in97,  in98,  in99,  in100, in101, in102, in103,
            in104, in105, in106, in107, in108, in109, in110, in111,
            in112, in113, in114, in115, in116, in117, in118, in119,
            in120, in121, in122, in123, in124, in125, in126, in127,
            select)
	begin
        case(select)
			5'd0: muxOut = {in0,in1,in2,in3};
			5'd1: muxOut = {in4,in5,in6,in7};
			5'd2: muxOut = {in8,in9,in10,in11};
			5'd3: muxOut = {in12,in13,in14,in15};
			5'd4: muxOut = {in16,in17,in18,in19};
			5'd5: muxOut = {in20,in21,in22,in23};
			5'd6: muxOut = {in24,in25,in26,in27};
			5'd7: muxOut = {in28,in29,in30,in31};
			5'd8: muxOut = {in32,in33,in34,in35};
			5'd9: muxOut = {in36,in37,in38,in39};
			5'd10: muxOut = {in40,in41,in42,in43};
			5'd11: muxOut = {in44,in45,in46,in47};
			5'd12: muxOut = {in48,in49,in50,in51};
			5'd13: muxOut = {in52,in53,in54,in55};
			5'd14: muxOut = {in56,in57,in58,in59};
			5'd15: muxOut = {in60,in61,in62,in63};
			5'd16: muxOut = {in64,in65,in66,in67};
			5'd17: muxOut = {in68,in69,in70,in71};
			5'd18: muxOut = {in72,in73,in74,in75};
			5'd19: muxOut = {in76,in77,in78,in79};
			5'd20: muxOut = {in80,in81,in82,in83};
			5'd21: muxOut = {in84,in85,in86,in87};
			5'd22: muxOut = {in88,in89,in90,in91};
			5'd23: muxOut = {in92,in93,in94,in95};
			5'd24: muxOut = {in96,in97,in98,in99};
			5'd25: muxOut = {in100,in101,in102,in103};
			5'd26: muxOut = {in104,in105,in106,in107};
			5'd27: muxOut = {in108,in109,in110,in111};
			5'd28: muxOut = {in112,in113,in114,in115};
			5'd29: muxOut = {in116,in117,in118,in119};
			5'd30: muxOut = {in120,in121,in122,in123};
			5'd31: muxOut = {in124,in125,in126,in127};
        endcase
    end
endmodule

//Active high decoder
module decoder_5to32(input[4:0] in, output reg[31:0] decOut);

    always@(in)
    begin
      case(in)
      5'b00000: begin decOut = 32'b00000000000000000000000000000001; end
      5'b00001: begin decOut = 32'b00000000000000000000000000000010; end
      5'b00010: begin decOut = 32'b00000000000000000000000000000100; end
      5'b00011: begin decOut = 32'b00000000000000000000000000001000; end
      5'b00100: begin decOut = 32'b00000000000000000000000000010000; end
      5'b00101: begin decOut = 32'b00000000000000000000000000100000; end
      5'b00110: begin decOut = 32'b00000000000000000000000001000000; end
      5'b00111: begin decOut = 32'b00000000000000000000000010000000; end
      5'b01000: begin decOut = 32'b00000000000000000000000100000000; end
      5'b01001: begin decOut = 32'b00000000000000000000001000000000; end
      5'b01010: begin decOut = 32'b00000000000000000000010000000000; end
      5'b01011: begin decOut = 32'b00000000000000000000100000000000; end
      5'b01100: begin decOut = 32'b00000000000000000001000000000000; end
      5'b01101: begin decOut = 32'b00000000000000000010000000000000; end
      5'b01110: begin decOut = 32'b00000000000000000100000000000000; end
      5'b01111: begin decOut = 32'b00000000000000001000000000000000; end
      5'b10000: begin decOut = 32'b00000000000000010000000000000000; end
      5'b10001: begin decOut = 32'b00000000000000100000000000000000; end
      5'b10010: begin decOut = 32'b00000000000001000000000000000000; end
      5'b10011: begin decOut = 32'b00000000000010000000000000000000; end
      5'b10100: begin decOut = 32'b00000000000100000000000000000000; end
      5'b10101: begin decOut = 32'b00000000001000000000000000000000; end
      5'b10110: begin decOut = 32'b00000000010000000000000000000000; end
      5'b10111: begin decOut = 32'b00000000100000000000000000000000; end
      5'b11000: begin decOut = 32'b00000001000000000000000000000000; end
      5'b11001: begin decOut = 32'b00000010000000000000000000000000; end
      5'b11010: begin decOut = 32'b00000100000000000000000000000000; end
      5'b11011: begin decOut = 32'b00001000000000000000000000000000; end
      5'b11100: begin decOut = 32'b00010000000000000000000000000000; end
      5'b11101: begin decOut = 32'b00100000000000000000000000000000; end
      5'b11110: begin decOut = 32'b01000000000000000000000000000000; end
      5'b11111: begin decOut = 32'b10000000000000000000000000000000; end
      endcase
    end
endmodule

//32 bit register
module register32bit(input clk, input reset, input regWrite, input decoderOut1bit, input[31:0] writeData, output[31:0] regOut);
//A N-bit register consists of N D flip-flops, each storing a bit of data.
//In this case, there will be 32 instances of D_ff, each taking writeData[0]...[31] as the d input and regOut[0]...[31] as the q output
D_ff G1(clk,reset,regWrite,decoderOut1bit,writeData[0] , regOut[0]);
D_ff G2(clk,reset,regWrite,decoderOut1bit,writeData[1] , regOut[1]);
D_ff G3(clk,reset,regWrite,decoderOut1bit,writeData[2] , regOut[2]);
D_ff G4(clk,reset,regWrite,decoderOut1bit,writeData[3] , regOut[3]);
D_ff G5(clk,reset,regWrite,decoderOut1bit,writeData[4] , regOut[4]);
D_ff G6(clk,reset,regWrite,decoderOut1bit,writeData[5] , regOut[5]);
D_ff G7(clk,reset,regWrite,decoderOut1bit,writeData[6] , regOut[6]);
D_ff G8(clk,reset,regWrite,decoderOut1bit,writeData[7] , regOut[7]);
D_ff G9(clk,reset,regWrite,decoderOut1bit,writeData[8] , regOut[8]);
D_ff G10(clk,reset,regWrite,decoderOut1bit,writeData[9] , regOut[9]);
D_ff G11(clk,reset,regWrite,decoderOut1bit,writeData[10] , regOut[10]);
D_ff G12(clk,reset,regWrite,decoderOut1bit,writeData[11] , regOut[11]);
D_ff G13(clk,reset,regWrite,decoderOut1bit,writeData[12] , regOut[12]);
D_ff G14(clk,reset,regWrite,decoderOut1bit,writeData[13] , regOut[13]);
D_ff G15(clk,reset,regWrite,decoderOut1bit,writeData[14] , regOut[14]);
D_ff G16(clk,reset,regWrite,decoderOut1bit,writeData[15] , regOut[15]);
D_ff G17(clk,reset,regWrite,decoderOut1bit,writeData[16] , regOut[16]);
D_ff G18(clk,reset,regWrite,decoderOut1bit,writeData[17] , regOut[17]);
D_ff G19(clk,reset,regWrite,decoderOut1bit,writeData[18] , regOut[18]);
D_ff G20(clk,reset,regWrite,decoderOut1bit,writeData[19] , regOut[19]);
D_ff G21(clk,reset,regWrite,decoderOut1bit,writeData[20] , regOut[20]);
D_ff G22(clk,reset,regWrite,decoderOut1bit,writeData[21] , regOut[21]);
D_ff G23(clk,reset,regWrite,decoderOut1bit,writeData[22] , regOut[22]);
D_ff G24(clk,reset,regWrite,decoderOut1bit,writeData[23] , regOut[23]);
D_ff G25(clk,reset,regWrite,decoderOut1bit,writeData[24] , regOut[24]);
D_ff G26(clk,reset,regWrite,decoderOut1bit,writeData[25] , regOut[25]);
D_ff G27(clk,reset,regWrite,decoderOut1bit,writeData[26] , regOut[26]);
D_ff G28(clk,reset,regWrite,decoderOut1bit,writeData[27] , regOut[27]);
D_ff G29(clk,reset,regWrite,decoderOut1bit,writeData[28] , regOut[28]);
D_ff G30(clk,reset,regWrite,decoderOut1bit,writeData[29] , regOut[29]);
D_ff G31(clk,reset,regWrite,decoderOut1bit,writeData[30] , regOut[30]);
D_ff G32(clk,reset,regWrite,decoderOut1bit,writeData[31] , regOut[31]);

endmodule

//register for Instruction Memory
module register_IM(input clk, input reset, input [7:0] d_in, output [7:0] q_out);
  // register_IM is an 8-bit register
	D_ff_IM dIM0 (clk, reset, d_in[0], q_out[0]);
	D_ff_IM dIM1 (clk, reset, d_in[1], q_out[1]);
	D_ff_IM dIM2 (clk, reset, d_in[2], q_out[2]);
	D_ff_IM dIM3 (clk, reset, d_in[3], q_out[3]);
	D_ff_IM dIM4 (clk, reset, d_in[4], q_out[4]);
	D_ff_IM dIM5 (clk, reset, d_in[5], q_out[5]);
	D_ff_IM dIM6 (clk, reset, d_in[6], q_out[6]);
	D_ff_IM dIM7 (clk, reset, d_in[7], q_out[7]);
endmodule



//register set with 32 registers
module registerSet(input clk, input reset, input regWrite, input[31:0] decoderOut, input[31:0] writeData,
    output [31:0] outR0, output[31:0] outR1, output[31:0] outR2, output[31:0] outR3, output[31:0] outR4, output[31:0] outR5, output[31:0] outR6, output[31:0] outR7,
    output [31:0] outR8, output[31:0] outR9, output[31:0] outR10, output[31:0] outR11, output[31:0] outR12, output[31:0] outR13, output[31:0] outR14, output[31:0] outR15,
    output [31:0] outR16, output[31:0] outR17, output[31:0] outR18, output[31:0] outR19, output[31:0] outR20, output[31:0] outR21, output[31:0] outR22, output[31:0] outR23,
    output [31:0] outR24, output[31:0] outR25, output[31:0] outR26, output[31:0] outR27, output[31:0] outR28, output[31:0] outR29, output[31:0] outR30, output[31:0] outR31);

    register32bit G32(clk, reset, regWrite , decoderOut[0] , writeData , outR0);
    register32bit G33(clk, reset, regWrite , decoderOut[1] , writeData , outR1);
    register32bit G34(clk, reset, regWrite , decoderOut[2] , writeData , outR2);
    register32bit G35(clk, reset, regWrite , decoderOut[3] , writeData , outR3);
    register32bit G36(clk, reset, regWrite , decoderOut[4] , writeData , outR4);
    register32bit G37(clk, reset, regWrite , decoderOut[5] , writeData , outR5);
    register32bit G38(clk, reset, regWrite , decoderOut[6] , writeData , outR6);
    register32bit G39(clk, reset, regWrite , decoderOut[7] , writeData , outR7);
    register32bit G40(clk, reset, regWrite , decoderOut[8] , writeData , outR8);
    register32bit G41(clk, reset, regWrite , decoderOut[9] , writeData , outR9);
    register32bit G42(clk, reset, regWrite , decoderOut[10] , writeData , outR10);
    register32bit G43(clk, reset, regWrite , decoderOut[11] , writeData , outR11);
    register32bit G44(clk, reset, regWrite , decoderOut[12] , writeData , outR12);
    register32bit G45(clk, reset, regWrite , decoderOut[13] , writeData , outR13);
    register32bit G46(clk, reset, regWrite , decoderOut[14] , writeData , outR14);
    register32bit G47(clk, reset, regWrite , decoderOut[15] , writeData , outR15);
    register32bit G48(clk, reset, regWrite , decoderOut[16] , writeData , outR16);
    register32bit G49(clk, reset, regWrite , decoderOut[17] , writeData , outR17);
    register32bit G50(clk, reset, regWrite , decoderOut[18] , writeData , outR18);
    register32bit G51(clk, reset, regWrite , decoderOut[19] , writeData , outR19);
    register32bit G52(clk, reset, regWrite , decoderOut[20] , writeData , outR20);
    register32bit G53(clk, reset, regWrite , decoderOut[21] , writeData , outR21);
    register32bit G54(clk, reset, regWrite , decoderOut[22] , writeData , outR22);
    register32bit G55(clk, reset, regWrite , decoderOut[23] , writeData , outR23);
    register32bit G56(clk, reset, regWrite , decoderOut[24] , writeData , outR24);
    register32bit G57(clk, reset, regWrite , decoderOut[25] , writeData , outR25);
    register32bit G58(clk, reset, regWrite , decoderOut[26] , writeData , outR26);
    register32bit G59(clk, reset, regWrite , decoderOut[27] , writeData , outR27);
    register32bit G60(clk, reset, regWrite , decoderOut[28] , writeData , outR28);
    register32bit G61(clk, reset, regWrite , decoderOut[29] , writeData , outR29);
    register32bit G62(clk, reset, regWrite , decoderOut[30] , writeData , outR30);
    register32bit G63(clk, reset, regWrite , decoderOut[31] , writeData , outR31);

endmodule

//register file for single cycle
module registerFile(input clk, input reset, input regWrite, input[4:0] rs, input[4:0] rt, input[4:0] rd, input[31:0] writeData, output[31:0] regRs, output[31:0] regRt);

    wire [31:0]decOut;
    wire [31:0] outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15, outR16, outR17, outR18, outR19, outR20, outR21, outR22, outR23, outR24, outR25, outR26, outR27, outR28, outR29, outR30 , outR31;

    decoder_5to32 G65(rd , decOut);
    registerSet G66(clk,reset,regWrite,decOut,writeData, outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8
                    ,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21
                    ,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31);

    mux32to1_32bit G67(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8
                    ,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21
                    ,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31 , rs , regRs);

    mux32to1_32bit G68(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8
                      ,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21
                      ,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31 , rt , regRt);

endmodule


//instruction memory for single cycle
module IM(input clk, input reset, input [4:0] pc_5bits, output [31:0] IR);
    wire [7:0] outR0,   outR1,   outR2,   outR3,   outR4,   outR5,   outR6,   outR7,
               outR8,   outR9,   outR10,  outR11,  outR12,  outR13,  outR14,  outR15,
               outR16,  outR17,  outR18,  outR19,  outR20,  outR21,  outR22,  outR23,
               outR24,  outR25,  outR26,  outR27,  outR28,  outR29,  outR30,  outR31,
               outR32,  outR33,  outR34,  outR35,  outR36,  outR37,  outR38,  outR39,
               outR40,  outR41,  outR42,  outR43,  outR44,  outR45,  outR46,  outR47,
               outR48,  outR49,  outR50,  outR51,  outR52,  outR53,  outR54,  outR55,
               outR56,  outR57,  outR58,  outR59,  outR60,  outR61,  outR62,  outR63,
               outR64,  outR65,  outR66,  outR67,  outR68,  outR69,  outR70,  outR71,
               outR72,  outR73,  outR74,  outR75,  outR76,  outR77,  outR78,  outR79,
               outR80,  outR81,  outR82,  outR83,  outR84,  outR85,  outR86,  outR87,
               outR88,  outR89,  outR90,  outR91,  outR92,  outR93,  outR94,  outR95,
               outR96,  outR97,  outR98,  outR99,  outR100, outR101, outR102, outR103,
               outR104, outR105, outR106, outR107, outR108, outR109, outR110, outR111,
               outR112, outR113, outR114, outR115, outR116, outR117, outR118, outR119,
               outR120, outR121, outR122, outR123, outR124, outR125, outR126, outR127;


register_IM rIM0   (clk, reset, 8'h20, outR0);  // addi $t0 , $zero , 32
register_IM rIM1   (clk, reset, 8'h08, outR1);
register_IM rIM2   (clk, reset, 8'h00, outR2);
register_IM rIM3   (clk, reset, 8'h20, outR3);
register_IM rIM4   (clk, reset, 8'h20, outR4);  // addi $t1 , $zero , 55
register_IM rIM5   (clk, reset, 8'h09, outR5);
register_IM rIM6   (clk, reset, 8'h00, outR6);
register_IM rIM7   (clk, reset, 8'h37, outR7);
register_IM rIM8   (clk, reset, 8'h01, outR8);  // and $s0 , $t0 , $t1
register_IM rIM9   (clk, reset, 8'h09, outR9);
register_IM rIM10  (clk, reset, 8'h80, outR10);
register_IM rIM11  (clk, reset, 8'h24, outR11);
register_IM rIM12  (clk, reset, 8'hAC, outR12); // sw $s0 , 4($zero)
register_IM rIM13  (clk, reset, 8'h10, outR13);
register_IM rIM14  (clk, reset, 8'h00, outR14);
register_IM rIM15  (clk, reset, 8'h04, outR15);
register_IM rIM16  (clk, reset, 8'hAC, outR16); // sw $t0 , 8($zero)
register_IM rIM17  (clk, reset, 8'h08, outR17);
register_IM rIM18  (clk, reset, 8'h00, outR18);
register_IM rIM19  (clk, reset, 8'h08, outR19);
register_IM rIM20  (clk, reset, 8'h8C, outR20); // lw $s1 , 4($zero)
register_IM rIM21  (clk, reset, 8'h11, outR21);
register_IM rIM22  (clk, reset, 8'h00, outR22);
register_IM rIM23  (clk, reset, 8'h04, outR23);
register_IM rIM24  (clk, reset, 8'h8C, outR24); // lw $s3 , 8($zero)
register_IM rIM25  (clk, reset, 8'h13, outR25);
register_IM rIM26  (clk, reset, 8'h00, outR26);
register_IM rIM27  (clk, reset, 8'h08, outR27);
register_IM rIM28  (clk, reset, 8'h12, outR28); // beq $s1 , $s3 , error
register_IM rIM29  (clk, reset, 8'h13, outR29);
register_IM rIM30  (clk, reset, 8'h00, outR30);
register_IM rIM31  (clk, reset, 8'h0A, outR31);
register_IM rIM32  (clk, reset, 8'h00, outR32);
register_IM rIM33  (clk, reset, 8'h00, outR33);
register_IM rIM34  (clk, reset, 8'h00, outR34);
register_IM rIM35  (clk, reset, 8'h00, outR35);
register_IM rIM36  (clk, reset, 8'h00, outR36);
register_IM rIM37  (clk, reset, 8'h00, outR37);
register_IM rIM38  (clk, reset, 8'h00, outR38);
register_IM rIM39  (clk, reset, 8'h00, outR39);
register_IM rIM40  (clk, reset, 8'h00, outR40);
register_IM rIM41  (clk, reset, 8'h00, outR41);
register_IM rIM42  (clk, reset, 8'h00, outR42);
register_IM rIM43  (clk, reset, 8'h00, outR43);
register_IM rIM44  (clk, reset, 8'h00, outR44);
register_IM rIM45  (clk, reset, 8'h00, outR45);
register_IM rIM46  (clk, reset, 8'h00, outR46);
register_IM rIM47  (clk, reset, 8'h00, outR47);
register_IM rIM48  (clk, reset, 8'h00, outR48);
register_IM rIM49  (clk, reset, 8'h00, outR49);
register_IM rIM50  (clk, reset, 8'h00, outR50);
register_IM rIM51  (clk, reset, 8'h00, outR51);
register_IM rIM52  (clk, reset, 8'h00, outR52);
register_IM rIM53  (clk, reset, 8'h00, outR53);
register_IM rIM54  (clk, reset, 8'h00, outR54);
register_IM rIM55  (clk, reset, 8'h00, outR55);
register_IM rIM56  (clk, reset, 8'h00, outR56);
register_IM rIM57  (clk, reset, 8'h00, outR57);
register_IM rIM58  (clk, reset, 8'h00, outR58);
register_IM rIM59  (clk, reset, 8'h00, outR59);
register_IM rIM60  (clk, reset, 8'h00, outR60);
register_IM rIM61  (clk, reset, 8'h00, outR61);
register_IM rIM62  (clk, reset, 8'h00, outR62);
register_IM rIM63  (clk, reset, 8'h00, outR63);
register_IM rIM64  (clk, reset, 8'h00, outR64);
register_IM rIM65  (clk, reset, 8'h00, outR65);
register_IM rIM66  (clk, reset, 8'h00, outR66);
register_IM rIM67  (clk, reset, 8'h00, outR67);
register_IM rIM68  (clk, reset, 8'h00, outR68);
register_IM rIM69  (clk, reset, 8'h00, outR69);
register_IM rIM70  (clk, reset, 8'h00, outR70);
register_IM rIM71  (clk, reset, 8'h00, outR71);
register_IM rIM72  (clk, reset, 8'h20, outR72);//addi $t0 , $0 , 3 (error)
register_IM rIM73  (clk, reset, 8'h08, outR73);
register_IM rIM74  (clk, reset, 8'h00, outR74);
register_IM rIM75  (clk, reset, 8'h03, outR75);
register_IM rIM76  (clk, reset, 8'h20, outR76);//addi $t1 , $0 , 2
register_IM rIM77  (clk, reset, 8'h09, outR77);
register_IM rIM78  (clk, reset, 8'h00, outR78);
register_IM rIM79  (clk, reset, 8'h02, outR79);
register_IM rIM80  (clk, reset, 8'h08, outR80);//j Exit
register_IM rIM81  (clk, reset, 8'h00, outR81);
register_IM rIM82  (clk, reset, 8'h00, outR82);
register_IM rIM83  (clk, reset, 8'h1F, outR83);
register_IM rIM84  (clk, reset, 8'h00, outR84);
register_IM rIM85  (clk, reset, 8'h00, outR85);
register_IM rIM86  (clk, reset, 8'h00, outR86);
register_IM rIM87  (clk, reset, 8'h00, outR87);
register_IM rIM88  (clk, reset, 8'h00, outR88);
register_IM rIM89  (clk, reset, 8'h00, outR89);
register_IM rIM90  (clk, reset, 8'h00, outR90);
register_IM rIM91  (clk, reset, 8'h00, outR91);
register_IM rIM92  (clk, reset, 8'h00, outR92);
register_IM rIM93  (clk, reset, 8'h00, outR93);
register_IM rIM94  (clk, reset, 8'h00, outR94);
register_IM rIM95  (clk, reset, 8'h00, outR95);
register_IM rIM96  (clk, reset, 8'h00, outR96);
register_IM rIM97  (clk, reset, 8'h00, outR97);
register_IM rIM98  (clk, reset, 8'h00, outR98);
register_IM rIM99  (clk, reset, 8'h00, outR99);
register_IM rIM100 (clk, reset, 8'h00, outR100);
register_IM rIM101 (clk, reset, 8'h00, outR101);
register_IM rIM102 (clk, reset, 8'h00, outR102);
register_IM rIM103 (clk, reset, 8'h00, outR103);
register_IM rIM104 (clk, reset, 8'h00, outR104);
register_IM rIM105 (clk, reset, 8'h00, outR105);
register_IM rIM106 (clk, reset, 8'h00, outR106);
register_IM rIM107 (clk, reset, 8'h00, outR107);
register_IM rIM108 (clk, reset, 8'h00, outR108);
register_IM rIM109 (clk, reset, 8'h00, outR109);
register_IM rIM110 (clk, reset, 8'h00, outR110);
register_IM rIM111 (clk, reset, 8'h00, outR111);
register_IM rIM112 (clk, reset, 8'h00, outR112);
register_IM rIM113 (clk, reset, 8'h00, outR113);
register_IM rIM114 (clk, reset, 8'h00, outR114);
register_IM rIM115 (clk, reset, 8'h00, outR115);
register_IM rIM116 (clk, reset, 8'h00, outR116);
register_IM rIM117 (clk, reset, 8'h00, outR117);
register_IM rIM118 (clk, reset, 8'h00, outR118);
register_IM rIM119 (clk, reset, 8'h00, outR119);
register_IM rIM120 (clk, reset, 8'h00, outR120);
register_IM rIM121 (clk, reset, 8'h00, outR121);
register_IM rIM122 (clk, reset, 8'h00, outR122);
register_IM rIM123 (clk, reset, 8'h00, outR123);
register_IM rIM124 (clk, reset, 8'h01, outR124); //slt $t2 ,$t0 , $t1 (Exit)
register_IM rIM125 (clk, reset, 8'h09, outR125);
register_IM rIM126 (clk, reset, 8'h50, outR126);
register_IM rIM127 (clk, reset, 8'h2A, outR127);


    mux128to1_IM_DM muxIM (outR0,   outR1,   outR2,   outR3,   outR4,   outR5,   outR6,   outR7,
                        outR8,   outR9,   outR10,  outR11,  outR12,  outR13,  outR14,  outR15,
                        outR16,  outR17,  outR18,  outR19,  outR20,  outR21,  outR22,  outR23,
                        outR24,  outR25,  outR26,  outR27,  outR28,  outR29,  outR30,  outR31,
                        outR32,  outR33,  outR34,  outR35,  outR36,  outR37,  outR38,  outR39,
                        outR40,  outR41,  outR42,  outR43,  outR44,  outR45,  outR46,  outR47,
                        outR48,  outR49,  outR50,  outR51,  outR52,  outR53,  outR54,  outR55,
                        outR56,  outR57,  outR58,  outR59,  outR60,  outR61,  outR62,  outR63,
                        outR64,  outR65,  outR66,  outR67,  outR68,  outR69,  outR70,  outR71,
                        outR72,  outR73,  outR74,  outR75,  outR76,  outR77,  outR78,  outR79,
                        outR80,  outR81,  outR82,  outR83,  outR84,  outR85,  outR86,  outR87,
                        outR88,  outR89,  outR90,  outR91,  outR92,  outR93,  outR94,  outR95,
                        outR96,  outR97,  outR98,  outR99,  outR100, outR101, outR102, outR103,
                        outR104, outR105, outR106, outR107, outR108, outR109, outR110, outR111,
                        outR112, outR113, outR114, outR115, outR116, outR117, outR118, outR119,
                        outR120, outR121, outR122, outR123, outR124, outR125, outR126, outR127,
                        pc_5bits, IR);
endmodule


//D flip flop for Data Memory
//works on negative edge of clock
// if reset is set make output 0
// else make it d when both regwrite and decOut1b are set.
module Dff_DM(input clk, input reset, input regWrite, input decOut1b , input d, output reg q);
//WRITE CODE HERE
  always @ (negedge clk)
  begin
  if(reset==1)
      q=0;
  else
      if(regWrite == 1 && decOut1b==1)
      begin
          q=d;
      end
  end

endmodule


//register for Data Memory
//use D flip flops for DM defined above
module register8bit_DM(input clk, input reset, input regWrite, input decOut1b, input [7:0] inR,
                     output [7:0] outR);
// WRITE CODE HERE

  Dff_DM D0 (clk, reset, regWrite, decOut1b, inR[0], outR[0]);
  Dff_DM D1 (clk, reset, regWrite, decOut1b, inR[1], outR[1]);
  Dff_DM D2 (clk, reset, regWrite, decOut1b, inR[2], outR[2]);
  Dff_DM D3 (clk, reset, regWrite, decOut1b, inR[3], outR[3]);
  Dff_DM D4 (clk, reset, regWrite, decOut1b, inR[4], outR[4]);
  Dff_DM D5 (clk, reset, regWrite, decOut1b, inR[5], outR[5]);
  Dff_DM D6 (clk, reset, regWrite, decOut1b, inR[6], outR[6]);
  Dff_DM D7 (clk, reset, regWrite, decOut1b, inR[7], outR[7]);

endmodule

// Data Memory for single cycle
// since address line is 5 bits i.e. 32 registers of 32 bit each is required
// we have defined 8 bit register_DM above, hence we require 4 of them for each 32 bit to store
// Remember data is stored in Big endian form in MIPS
module DM(input clk, input reset, input memWrite,input memRead, input [4:0] address, input [31:0] writeData , output [31:0] read_data);
// WRITE CODE HERE

  wire[31:0] decOut;
  decoder_5to32 decoderOut(address[4: 0], decOut[31: 0]);

  wire [7: 0] outReg0, outReg1, outReg2, outReg3, outReg4, outReg5, outReg6, outReg7, outReg8, outReg9, outReg10,
  outReg11, outReg12, outReg13, outReg14, outReg15, outReg16, outReg17, outReg18, outReg19, outReg20,
  outReg21, outReg22, outReg23, outReg24, outReg25, outReg26, outReg27, outReg28, outReg29, outReg30,
  outReg31, outReg32, outReg33, outReg34, outReg35, outReg36, outReg37, outReg38, outReg39, outReg40,
  outReg41, outReg42, outReg43, outReg44, outReg45, outReg46, outReg47, outReg48, outReg49, outReg50,
  outReg51, outReg52, outReg53, outReg54, outReg55, outReg56, outReg57, outReg58, outReg59, outReg60,
  outReg61, outReg62, outReg63, outReg64, outReg65, outReg66, outReg67, outReg68, outReg69, outReg70,
  outReg71, outReg72, outReg73, outReg74, outReg75, outReg76, outReg77, outReg78, outReg79, outReg80,
  outReg81, outReg82, outReg83, outReg84, outReg85, outReg86, outReg87, outReg88, outReg89, outReg90,
  outReg91, outReg92, outReg93, outReg94, outReg95, outReg96, outReg97, outReg98, outReg99, outReg100,
  outReg101, outReg102, outReg103, outReg104, outReg105, outReg106, outReg107, outReg108, outReg109, outReg110,
  outReg111, outReg112, outReg113, outReg114, outReg115, outReg116, outReg117, outReg118, outReg119, outReg120,
  outReg121, outReg122, outReg123, outReg124, outReg125, outReg126, outReg127;

  register8bit_DM reg0(clk, reset, memWrite, decOut[0], writeData[31: 24], outReg0[7: 0]);
  register8bit_DM reg1(clk, reset, memWrite, decOut[0], writeData[23: 16], outReg1[7: 0]);
  register8bit_DM reg2(clk, reset, memWrite, decOut[0], writeData[15: 8], outReg2[7: 0]);
  register8bit_DM reg3(clk, reset, memWrite, decOut[0], writeData[7: 0], outReg3[7: 0]);

  register8bit_DM reg4(clk, reset, memWrite, decOut[1], writeData[31: 24], outReg4[7: 0]);
  register8bit_DM reg5(clk, reset, memWrite, decOut[1], writeData[23: 16], outReg5[7: 0]);
  register8bit_DM reg6(clk, reset, memWrite, decOut[1], writeData[15: 8], outReg6[7: 0]);
  register8bit_DM reg7(clk, reset, memWrite, decOut[1], writeData[7: 0], outReg7[7: 0]);

  register8bit_DM reg8(clk, reset, memWrite, decOut[2], writeData[31: 24], outReg8[7: 0]);
  register8bit_DM reg9(clk, reset, memWrite, decOut[2], writeData[23: 16], outReg9[7: 0]);
  register8bit_DM reg10(clk, reset, memWrite, decOut[2], writeData[15: 8], outReg10[7: 0]);
  register8bit_DM reg11(clk, reset, memWrite, decOut[2], writeData[7: 0], outReg11[7: 0]);

  register8bit_DM reg12(clk, reset, memWrite, decOut[3], writeData[31: 24], outReg12[7: 0]);
  register8bit_DM reg13(clk, reset, memWrite, decOut[3], writeData[23: 16], outReg13[7: 0]);
  register8bit_DM reg14(clk, reset, memWrite, decOut[3], writeData[15: 8], outReg14[7: 0]);
  register8bit_DM reg15(clk, reset, memWrite, decOut[3], writeData[7: 0], outReg15[7: 0]);

  register8bit_DM reg16(clk, reset, memWrite, decOut[4], writeData[31: 24], outReg16[7: 0]);
  register8bit_DM reg17(clk, reset, memWrite, decOut[4], writeData[23: 16], outReg17[7: 0]);
  register8bit_DM reg18(clk, reset, memWrite, decOut[4], writeData[15: 8], outReg18[7: 0]);
  register8bit_DM reg19(clk, reset, memWrite, decOut[4], writeData[7: 0], outReg19[7: 0]);

  register8bit_DM reg20(clk, reset, memWrite, decOut[5], writeData[31: 24], outReg20[7: 0]);
  register8bit_DM reg21(clk, reset, memWrite, decOut[5], writeData[23: 16], outReg21[7: 0]);
  register8bit_DM reg22(clk, reset, memWrite, decOut[5], writeData[15: 8], outReg22[7: 0]);
  register8bit_DM reg23(clk, reset, memWrite, decOut[5], writeData[7: 0], outReg23[7: 0]);

  register8bit_DM reg24(clk, reset, memWrite, decOut[6], writeData[31: 24], outReg24[7: 0]);
  register8bit_DM reg25(clk, reset, memWrite, decOut[6], writeData[23: 16], outReg25[7: 0]);
  register8bit_DM reg26(clk, reset, memWrite, decOut[6], writeData[15: 8], outReg26[7: 0]);
  register8bit_DM reg27(clk, reset, memWrite, decOut[6], writeData[7: 0], outReg27[7: 0]);

  register8bit_DM reg28(clk, reset, memWrite, decOut[7], writeData[31: 24], outReg28[7: 0]);
  register8bit_DM reg29(clk, reset, memWrite, decOut[7], writeData[23: 16], outReg29[7: 0]);
  register8bit_DM reg30(clk, reset, memWrite, decOut[7], writeData[15: 8], outReg30[7: 0]);
  register8bit_DM reg31(clk, reset, memWrite, decOut[7], writeData[7: 0], outReg31[7: 0]);

  register8bit_DM reg32(clk, reset, memWrite, decOut[8], writeData[31: 24], outReg32[7: 0]);
  register8bit_DM reg33(clk, reset, memWrite, decOut[8], writeData[23: 16], outReg33[7: 0]);
  register8bit_DM reg34(clk, reset, memWrite, decOut[8], writeData[15: 8], outReg34[7: 0]);
  register8bit_DM reg35(clk, reset, memWrite, decOut[8], writeData[7: 0], outReg35[7: 0]);

  register8bit_DM reg36(clk, reset, memWrite, decOut[9], writeData[31: 24], outReg36[7: 0]);
  register8bit_DM reg37(clk, reset, memWrite, decOut[9], writeData[23: 16], outReg37[7: 0]);
  register8bit_DM reg38(clk, reset, memWrite, decOut[9], writeData[15: 8], outReg38[7: 0]);
  register8bit_DM reg39(clk, reset, memWrite, decOut[9], writeData[7: 0], outReg39[7: 0]);

  register8bit_DM reg40(clk, reset, memWrite, decOut[10], writeData[31: 24], outReg40[7: 0]);
  register8bit_DM reg41(clk, reset, memWrite, decOut[10], writeData[23: 16], outReg41[7: 0]);
  register8bit_DM reg42(clk, reset, memWrite, decOut[10], writeData[15: 8], outReg42[7: 0]);
  register8bit_DM reg43(clk, reset, memWrite, decOut[10], writeData[7: 0], outReg43[7: 0]);

  register8bit_DM reg44(clk, reset, memWrite, decOut[11], writeData[31: 24], outReg44[7: 0]);
  register8bit_DM reg45(clk, reset, memWrite, decOut[11], writeData[23: 16], outReg45[7: 0]);
  register8bit_DM reg46(clk, reset, memWrite, decOut[11], writeData[15: 8], outReg46[7: 0]);
  register8bit_DM reg47(clk, reset, memWrite, decOut[11], writeData[7: 0], outReg47[7: 0]);

  register8bit_DM reg48(clk, reset, memWrite, decOut[12], writeData[31: 24], outReg48[7: 0]);
  register8bit_DM reg49(clk, reset, memWrite, decOut[12], writeData[23: 16], outReg49[7: 0]);
  register8bit_DM reg50(clk, reset, memWrite, decOut[12], writeData[15: 8], outReg50[7: 0]);
  register8bit_DM reg51(clk, reset, memWrite, decOut[12], writeData[7: 0], outReg51[7: 0]);

  register8bit_DM reg52(clk, reset, memWrite, decOut[13], writeData[31: 24], outReg52[7: 0]);
  register8bit_DM reg53(clk, reset, memWrite, decOut[13], writeData[23: 16], outReg53[7: 0]);
  register8bit_DM reg54(clk, reset, memWrite, decOut[13], writeData[15: 8], outReg54[7: 0]);
  register8bit_DM reg55(clk, reset, memWrite, decOut[13], writeData[7: 0], outReg55[7: 0]);

  register8bit_DM reg56(clk, reset, memWrite, decOut[14], writeData[31: 24], outReg56[7: 0]);
  register8bit_DM reg57(clk, reset, memWrite, decOut[14], writeData[23: 16], outReg57[7: 0]);
  register8bit_DM reg58(clk, reset, memWrite, decOut[14], writeData[15: 8], outReg58[7: 0]);
  register8bit_DM reg59(clk, reset, memWrite, decOut[14], writeData[7: 0], outReg59[7: 0]);

  register8bit_DM reg60(clk, reset, memWrite, decOut[15], writeData[31: 24], outReg60[7: 0]);
  register8bit_DM reg61(clk, reset, memWrite, decOut[15], writeData[23: 16], outReg61[7: 0]);
  register8bit_DM reg62(clk, reset, memWrite, decOut[15], writeData[15: 8], outReg62[7: 0]);
  register8bit_DM reg63(clk, reset, memWrite, decOut[15], writeData[7: 0], outReg63[7: 0]);

  register8bit_DM reg64(clk, reset, memWrite, decOut[16], writeData[31: 24], outReg64[7: 0]);
  register8bit_DM reg65(clk, reset, memWrite, decOut[16], writeData[23: 16], outReg65[7: 0]);
  register8bit_DM reg66(clk, reset, memWrite, decOut[16], writeData[15: 8], outReg66[7: 0]);
  register8bit_DM reg67(clk, reset, memWrite, decOut[16], writeData[7: 0], outReg67[7: 0]);

  register8bit_DM reg68(clk, reset, memWrite, decOut[17], writeData[31: 24], outReg68[7: 0]);
  register8bit_DM reg69(clk, reset, memWrite, decOut[17], writeData[23: 16], outReg69[7: 0]);
  register8bit_DM reg70(clk, reset, memWrite, decOut[17], writeData[15: 8], outReg70[7: 0]);
  register8bit_DM reg71(clk, reset, memWrite, decOut[17], writeData[7: 0], outReg71[7: 0]);

  register8bit_DM reg72(clk, reset, memWrite, decOut[18], writeData[31: 24], outReg72[7: 0]);
  register8bit_DM reg73(clk, reset, memWrite, decOut[18], writeData[23: 16], outReg73[7: 0]);
  register8bit_DM reg74(clk, reset, memWrite, decOut[18], writeData[15: 8], outReg74[7: 0]);
  register8bit_DM reg75(clk, reset, memWrite, decOut[18], writeData[7: 0], outReg75[7: 0]);

  register8bit_DM reg76(clk, reset, memWrite, decOut[19], writeData[31: 24], outReg76[7: 0]);
  register8bit_DM reg77(clk, reset, memWrite, decOut[19], writeData[23: 16], outReg77[7: 0]);
  register8bit_DM reg78(clk, reset, memWrite, decOut[19], writeData[15: 8], outReg78[7: 0]);
  register8bit_DM reg79(clk, reset, memWrite, decOut[19], writeData[7: 0], outReg79[7: 0]);

  register8bit_DM reg80(clk, reset, memWrite, decOut[20], writeData[31: 24], outReg80[7: 0]);
  register8bit_DM reg81(clk, reset, memWrite, decOut[20], writeData[23: 16], outReg81[7: 0]);
  register8bit_DM reg82(clk, reset, memWrite, decOut[20], writeData[15: 8], outReg82[7: 0]);
  register8bit_DM reg83(clk, reset, memWrite, decOut[20], writeData[7: 0], outReg83[7: 0]);

  register8bit_DM reg84(clk, reset, memWrite, decOut[21], writeData[31: 24], outReg84[7: 0]);
  register8bit_DM reg85(clk, reset, memWrite, decOut[21], writeData[23: 16], outReg85[7: 0]);
  register8bit_DM reg86(clk, reset, memWrite, decOut[21], writeData[15: 8], outReg86[7: 0]);
  register8bit_DM reg87(clk, reset, memWrite, decOut[21], writeData[7: 0], outReg87[7: 0]);

  register8bit_DM reg88(clk, reset, memWrite, decOut[22], writeData[31: 24], outReg88[7: 0]);
  register8bit_DM reg89(clk, reset, memWrite, decOut[22], writeData[23: 16], outReg89[7: 0]);
  register8bit_DM reg90(clk, reset, memWrite, decOut[22], writeData[15: 8], outReg90[7: 0]);
  register8bit_DM reg91(clk, reset, memWrite, decOut[22], writeData[7: 0], outReg91[7: 0]);

  register8bit_DM reg92(clk, reset, memWrite, decOut[23], writeData[31: 24], outReg92[7: 0]);
  register8bit_DM reg93(clk, reset, memWrite, decOut[23], writeData[23: 16], outReg93[7: 0]);
  register8bit_DM reg94(clk, reset, memWrite, decOut[23], writeData[15: 8], outReg94[7: 0]);
  register8bit_DM reg95(clk, reset, memWrite, decOut[23], writeData[7: 0], outReg95[7: 0]);

  register8bit_DM reg96(clk, reset, memWrite, decOut[24], writeData[31: 24], outReg96[7: 0]);
  register8bit_DM reg97(clk, reset, memWrite, decOut[24], writeData[23: 16], outReg97[7: 0]);
  register8bit_DM reg98(clk, reset, memWrite, decOut[24], writeData[15: 8], outReg98[7: 0]);
  register8bit_DM reg99(clk, reset, memWrite, decOut[24], writeData[7: 0], outReg99[7: 0]);

  register8bit_DM reg100(clk, reset, memWrite, decOut[25], writeData[31: 24], outReg100[7: 0]);
  register8bit_DM reg101(clk, reset, memWrite, decOut[25], writeData[23: 16], outReg101[7: 0]);
  register8bit_DM reg102(clk, reset, memWrite, decOut[25], writeData[15: 8], outReg102[7: 0]);
  register8bit_DM reg103(clk, reset, memWrite, decOut[25], writeData[7: 0], outReg103[7: 0]);

  register8bit_DM reg104(clk, reset, memWrite, decOut[26], writeData[31: 24], outReg104[7: 0]);
  register8bit_DM reg105(clk, reset, memWrite, decOut[26], writeData[23: 16], outReg105[7: 0]);
  register8bit_DM reg106(clk, reset, memWrite, decOut[26], writeData[15: 8], outReg106[7: 0]);
  register8bit_DM reg107(clk, reset, memWrite, decOut[26], writeData[7: 0], outReg107[7: 0]);

  register8bit_DM reg108(clk, reset, memWrite, decOut[27], writeData[31: 24], outReg108[7: 0]);
  register8bit_DM reg109(clk, reset, memWrite, decOut[27], writeData[23: 16], outReg109[7: 0]);
  register8bit_DM reg110(clk, reset, memWrite, decOut[27], writeData[15: 8], outReg110[7: 0]);
  register8bit_DM reg111(clk, reset, memWrite, decOut[27], writeData[7: 0], outReg111[7: 0]);

  register8bit_DM reg112(clk, reset, memWrite, decOut[28], writeData[31: 24], outReg112[7: 0]);
  register8bit_DM reg113(clk, reset, memWrite, decOut[28], writeData[23: 16], outReg113[7: 0]);
  register8bit_DM reg114(clk, reset, memWrite, decOut[28], writeData[15: 8], outReg114[7: 0]);
  register8bit_DM reg115(clk, reset, memWrite, decOut[28], writeData[7: 0], outReg115[7: 0]);

  register8bit_DM reg116(clk, reset, memWrite, decOut[29], writeData[31: 24], outReg116[7: 0]);
  register8bit_DM reg117(clk, reset, memWrite, decOut[29], writeData[23: 16], outReg117[7: 0]);
  register8bit_DM reg118(clk, reset, memWrite, decOut[29], writeData[15: 8], outReg118[7: 0]);
  register8bit_DM reg119(clk, reset, memWrite, decOut[29], writeData[7: 0], outReg119[7: 0]);

  register8bit_DM reg120(clk, reset, memWrite, decOut[30], writeData[31: 24], outReg120[7: 0]);
  register8bit_DM reg121(clk, reset, memWrite, decOut[30], writeData[23: 16], outReg121[7: 0]);
  register8bit_DM reg122(clk, reset, memWrite, decOut[30], writeData[15: 8], outReg122[7: 0]);
  register8bit_DM reg123(clk, reset, memWrite, decOut[30], writeData[7: 0], outReg123[7: 0]);

  register8bit_DM reg124(clk, reset, memWrite, decOut[31], writeData[31: 24], outReg124[7: 0]);
  register8bit_DM reg125(clk, reset, memWrite, decOut[31], writeData[23: 16], outReg125[7: 0]);
  register8bit_DM reg126(clk, reset, memWrite, decOut[31], writeData[15: 8], outReg126[7: 0]);
  register8bit_DM reg127(clk, reset, memWrite, decOut[31], writeData[7: 0], outReg127[7: 0]);

  wire [31: 0] muxOut;

  mux128to1_IM_DM muxDM (outReg0[7:0],   outReg1[7:0],   outReg2[7:0],   outReg3[7:0],   outReg4[7:0],   outReg5[7:0],   outReg6[7:0],   outReg7[7:0],
                      outReg8[7:0],   outReg9[7:0],   outReg10[7:0],  outReg11[7:0],  outReg12[7:0],  outReg13[7:0],  outReg14[7:0],  outReg15[7:0],
                      outReg16[7:0],  outReg17[7:0],  outReg18[7:0],  outReg19[7:0],  outReg20[7:0],  outReg21[7:0],  outReg22[7:0],  outReg23[7:0],
                      outReg24[7:0],  outReg25[7:0],  outReg26[7:0],  outReg27[7:0],  outReg28[7:0],  outReg29[7:0],  outReg30[7:0],  outReg31[7:0],
                      outReg32[7:0],  outReg33[7:0],  outReg34[7:0],  outReg35[7:0],  outReg36[7:0],  outReg37[7:0],  outReg38[7:0],  outReg39[7:0],
                      outReg40[7:0],  outReg41[7:0],  outReg42[7:0],  outReg43[7:0],  outReg44[7:0],  outReg45[7:0],  outReg46[7:0],  outReg47[7:0],
                      outReg48[7:0],  outReg49[7:0],  outReg50[7:0],  outReg51[7:0],  outReg52[7:0],  outReg53[7:0],  outReg54[7:0],  outReg55[7:0],
                      outReg56[7:0],  outReg57[7:0],  outReg58[7:0],  outReg59[7:0],  outReg60[7:0],  outReg61[7:0],  outReg62[7:0],  outReg63[7:0],
                      outReg64[7:0],  outReg65[7:0],  outReg66[7:0],  outReg67[7:0],  outReg68[7:0],  outReg69[7:0],  outReg70[7:0],  outReg71[7:0],
                      outReg72[7:0],  outReg73[7:0],  outReg74[7:0],  outReg75[7:0],  outReg76[7:0],  outReg77[7:0],  outReg78[7:0],  outReg79[7:0],
                      outReg80[7:0],  outReg81[7:0],  outReg82[7:0],  outReg83[7:0],  outReg84[7:0],  outReg85[7:0],  outReg86[7:0],  outReg87[7:0],
                      outReg88[7:0],  outReg89[7:0],  outReg90[7:0],  outReg91[7:0],  outReg92[7:0],  outReg93[7:0],  outReg94[7:0],  outReg95[7:0],
                      outReg96[7:0],  outReg97[7:0],  outReg98[7:0],  outReg99[7:0],  outReg100[7:0], outReg101[7:0], outReg102[7:0], outReg103[7:0],
                      outReg104[7:0], outReg105[7:0], outReg106[7:0], outReg107[7:0], outReg108[7:0], outReg109[7:0], outReg110[7:0], outReg111[7:0],
                      outReg112[7:0], outReg113[7:0], outReg114[7:0], outReg115[7:0], outReg116[7:0], outReg117[7:0], outReg118[7:0], outReg119[7:0],
                      outReg120[7:0], outReg121[7:0], outReg122[7:0], outReg123[7:0], outReg124[7:0], outReg125[7:0], outReg126[7:0], outReg127[7:0],
                      address[4:0], muxOut[31:0]);

  mux2to1_32bit mux_DM_out(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, muxOut[31:0], memRead, read_data[31:0]);

endmodule

//add given two inputs
module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
// WRITE CODE HERE

  always @ (in1 or in2)
    adder_out=in1+in2;

endmodule

// if number is -ve append all 1's at the start else append all 0's
module signExt16to32( input [15:0] offset, output reg [31:0] signExtOffset);
//WRITE CODE HERE

  always @ (*)
  begin
    signExtOffset[15: 0]=offset[15: 0];
    if(offset[15]==1'b1)
      signExtOffset[31: 16]=16'b1111111111111111;
    else
      signExtOffset[31: 16]=16'b0000000000000000;
  end

endmodule

// follow the table given in question pdf
module aluCtrl(input [1:0] aluOp, input [5:0] fun,output reg [3:0] operation);
//WRITE CODE HERE

  always @ (*)
  begin
    if(aluOp == 2'b00)
      operation = 4'b0010;
    else if(aluOp[0] == 1'b1)
      operation = 4'b0110;
    else if(aluOp[1] == 1'b1)
    begin
      if(fun[3: 0] == 4'b0000)
        operation = 4'b0010;
      else if(fun[3: 0] == 4'b0010)
        operation = 4'b0110;
      else if(fun[3: 0] == 4'b0100)
        operation = 4'b0000;
      else if(fun[3: 0] == 4'b0101)
        operation = 4'b0001;
      else if(fun[3: 0] == 4'b1010)
        operation = 4'b0111;
    end
  end

endmodule

// follow the table of control circuit given in pdf
module ctrlCkt	(input [5:0] opcode, output reg RegDst ,output reg jump, output reg ALUSrc, output reg MemtoReg, output reg RegWrite,
                  output reg MemRead , output reg MemWrite, output reg Branch , output reg [1:0]ALUOp );
//WRITE CODE HERE

  always @ (*)
  begin
    if(opcode == 6'b000000)
    begin
      RegDst = 1'b1;
      Branch = 1'b0;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      ALUOp = 2'b10;
      MemWrite = 1'b0;
      ALUSrc = 1'b0;
      RegWrite = 1'b1;
      jump = 1'b0;
    end
    else if(opcode == 6'b001000)
    begin
      RegDst = 1'b0;
      Branch = 1'b0;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      ALUOp = 2'b00;
      MemWrite = 1'b0;
      ALUSrc = 1'b1;
      RegWrite = 1'b1;
      jump = 1'b0;
    end
    else if(opcode == 6'b100011)
    begin
      RegDst = 1'b0;
      Branch = 1'b0;
      MemRead = 1'b1;
      MemtoReg = 1'b1;
      ALUOp = 2'b00;
      MemWrite = 1'b0;
      ALUSrc = 1'b1;
      RegWrite = 1'b1;
      jump = 1'b0;
    end
    else if(opcode == 6'b101011)
    begin
      RegDst = 1'bx;
      Branch = 1'b0;
      MemRead = 1'b0;
      MemtoReg = 1'bx;
      ALUOp = 2'b00;
      MemWrite = 1'b1;
      ALUSrc = 1'b1;
      RegWrite = 1'b0;
      jump = 1'b0;
    end
    else if(opcode == 6'b000100)
    begin
      RegDst = 1'bx;
      Branch = 1'b1;
      MemRead = 1'b0;
      MemtoReg = 1'bx;
      ALUOp = 2'b01;
      MemWrite = 1'b0;
      ALUSrc = 1'b0;
      RegWrite = 1'b0;
      jump = 1'b0;
    end
    else if(opcode == 6'b000010)
    begin
      RegDst = 1'bx;
      Branch = 1'b0;
      MemRead = 1'bx;
      MemtoReg = 1'bx;
      ALUOp = 2'bxx;
      MemWrite = 1'bx;
      ALUSrc = 1'bx;
      RegWrite = 1'bx;
      jump = 1'b1;
    end
  end

endmodule

//perform airthemtic or logical operations based on value of "operation"
module alu(input [31:0] aluIn1, input [31:0] aluIn2,input [3:0]operation ,output reg zero,output reg [31:0]aluOut);
//WRITE CODE HERE

  always@(*)
  begin
     if (operation == 4'b0000)
         aluOut = aluIn1 & aluIn2;
     else if (operation == 4'b0001)
         aluOut = aluIn1 | aluIn2;
     else if (operation == 4'b0010)
         aluOut = aluIn1 + aluIn2;
     else if (operation == 4'b0110)
         aluOut = aluIn1 - aluIn2;
     else if (operation == 4'b0111)
     begin
         if(aluIn1 < aluIn2)
          aluOut = 32'd1;
         else if(aluIn1 > aluIn2)
          aluOut = 32'd0;
     end
     else if (operation == 4'b1100)
         aluOut = ~(aluIn1 | aluIn2);

    if(aluOut == 32'b00000000000000000000000000000000)
      zero = 1'b1;
    else
      zero = 1'b0;
  end

endmodule

module singleCycle(input clk, input reset);
// WRITE CODE HERE
  wire [31:0]  inPC, outPC, IR, adderout,aluIn1,readData2,aluIn2,aluOut,read_data,writeData,ALUResult,muxOutput,signExtSet;
  wire[1:0] ALUOp;
  wire[4:0] WriteReg;
  wire[3:0] aluControlOut;
  wire RegDst, jump, ALUSrc, MemtoReg, RegWrite, MemRead , MemWrite, Branch,zero;

  register32bit pc(clk, reset, 1'b1, 1'b1, inPC, outPC);
  adder add_pc(32'd4, outPC, adderout);
  IM im_out(clk, reset, outPC[6:2], IR);

  ctrlCkt cktCtrl(IR[31:26], RegDst, jump, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
  mux2to1_5bit mux0(IR[20:16], IR[15:11], RegDst, WriteReg);

  registerFile regFile(clk, reset, RegWrite, IR[25:21], IR[20:16], WriteReg, writeData,  aluIn1, readData2);
  signExt16to32 extSign(IR[15:0], signExtSet);

  mux2to1_32bit mux1(readData2, signExtSet, ALUSrc, aluIn2);
  aluCtrl ctrl(ALUOp, IR[5:0], aluControlOut);
  alu aluO(aluIn1, aluIn2, aluControlOut, zero, aluOut);

  adder add1(adderout, {signExtSet[29:0], 2'b00}, ALUResult);

  mux2to1_32bit mux2(adderout, ALUResult, (zero & Branch), muxOutput);
  mux2to1_32bit mux3(muxOutput, {adderout[31:28], IR[25:0], 2'b00}, jump, inPC);

  DM dm_Out(clk, reset, MemWrite, MemRead, aluOut[6:2], readData2, read_data);
  mux2to1_32bit mux4(aluOut, read_data, MemtoReg, writeData);


endmodule

module singleCycleTestBench;
	reg clk;
	reg reset;
	singleCycle uut (.clk(clk), .reset(reset));

	always
	#5 clk=~clk;

	initial
	begin
    $dumpfile("2017B5A70834G_Lab4.vcd");
    $dumpvars(0, singleCycleTestBench);
		clk=0; reset=1;
		#5  reset=0;
		#115 $finish;
	end
endmodule
