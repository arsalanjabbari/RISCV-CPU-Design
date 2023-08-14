`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture Project
//////////////////////////////////////////////////////////////////////////////////

module IF_ID_Register(
	input [31:0]instruction,
	input [31:0]PCplusFour,
	input clk, hit,
	
	output reg [31:0] outInstruction,
	output reg [31:0] outNextPC
    );

	always@(negedge clk)
		begin
			if(hit == 1) 
				begin
					outInstruction = instruction;
					outNextPC = PCplusFour;
				end
		end

endmodule
