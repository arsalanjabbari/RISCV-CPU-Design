`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture Project
//////////////////////////////////////////////////////////////////////////////////

module Mem_WB_Register(
		input [31:0]ALUout, MemoryOut,
		input [4:0]writeReg,
		input [1:0]controlSig,
		input clk, hit,
		
		output reg [31:0] outALUot, outMemoryOut,
		output reg [4:0] outWriteReg,
		output reg [1:0] outControlSig
    );

	always @(negedge clk) 
		begin
			if(hit == 1) 
				begin
					outALUot = ALUout;
					outMemoryOut = MemoryOut;
					outWriteReg = writeReg;
					outControlSig = controlSig;
				end		
		end

endmodule
