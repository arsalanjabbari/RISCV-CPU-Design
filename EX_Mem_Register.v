`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture Project
//////////////////////////////////////////////////////////////////////////////////

module EX_Mem_Register(
		input [31:0]ALUout, RD2,
		input [31:0]PCBranch,
		input [4:0]writeReg,
		input [4:0]controlSignals,
		input clk, hit, zero,
		
		output reg [31:0]outALUout, outRD2,
		output reg [31:0]outPCBranch,
		output reg [4:0]outWriteReg,
		output reg [4:0]outControlSignals,
		output reg outZero
    );

	always @(posedge clk) 
		begin
			if(hit == 1) 
				begin
					outALUout = ALUout;
					outRD2 = RD2;
					outPCBranch = PCBranch;
					outWriteReg = writeReg;
					outControlSignals = controlSignals;
					outZero = zero;
				end
		end	

endmodule
