`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture Project
//////////////////////////////////////////////////////////////////////////////////

module ID_EX_Register(
	input [31:0]nextPC,
	input [31:0]signExt,
	input [31:0]RD1,
	input [31:0]RD2,
	input [4:0]rd,
	input [4:0]rs2,
	input [8:0]controlUnit,
	input clk, hit,
	
	output reg [31:0]outNextPC,
	output reg [31:0]outSignExt,
	output reg [31:0]outRD1,
	output reg [31:0]outRD2,
	output reg [4:0]outrd,
	output reg [4:0]outrs2,
	output reg [10:0]outControlUnit
    );
	 
	always @(posedge clk) begin
	
		if(hit == 1) 
			begin
				outNextPC = nextPC;
				outSignExt = signExt;
				outRD1 = RD1;
				outRD2 = RD2;
				outrd = rd;
				outrs2 = rs2;
				outControlUnit = controlUnit;
			end
					
	end

endmodule
