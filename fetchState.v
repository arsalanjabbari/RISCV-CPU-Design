`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 3
//////////////////////////////////////////////////////////////////////////////////

module fetchState(
		input [31:0]branchTarget,
		input clk, PCSource,   
	
		output [31:0]nextPC,		 
		output [31:0]instruction,    
		output hit_result
    );

    wire [31:0] muxToPC;
    wire [31:0] outPC;
    wire [127:0] dataLine;
	 
	Multiplexer2To1 the_Multiplexer2To1 (
		 .A(nextPC), 
		 .B(branchTarget), 
		 .select(PCSource), 
		 .Out(muxToPC)
		 );	 
		 
	PC the_PC (
		 .Address(muxToPC), 
		 .clk(clk), 
		 .hit(hit_result), 
		 .result(outPC)
		 );
		 
	instructionCache the_instructionCache (
		 .address(outPC), 
		 .inputData(dataLine), 
		 .clk(clk), 
		 .outData(instruction), 
		 .hit(hit_result)
		 );
		 
	instructionMem the_instructionMem (
		 .address(outPC), 
		 .clk(clk), 
		 .outData(dataLine)
		 );
		 	 
	 assign nextPC = outPC + 4;


endmodule
