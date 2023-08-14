`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 1
//////////////////////////////////////////////////////////////////////////////////

module Multiplexer2To1(
	input [31:0]A,
	input [31:0]B,
	input select,
	
	output reg [31:0]Out
    );
	 
	 always@(*)
	 begin
	 
		if(select)
			Out = B;
		else
			Out = A;
			
	 end


endmodule
