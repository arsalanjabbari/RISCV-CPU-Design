`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 2
//////////////////////////////////////////////////////////////////////////////////

module RegisterFile(
	input [4:0]rs1, rs2, rd,
	input clk, writeSignal,
	input [31:0]data,
	
	output reg [31:0]dataOut1, dataOut2
    );
	 
	 reg [31:0]registers[31:0];
	 
	 integer i;
	 initial begin
		for(i=0;i<31;i=i+1) begin
			registers[i] = 0;
		end
	 end
	 
	 always@(negedge clk)
	 begin
	 
		 if(writeSignal == 1 & rd != 0)
			 begin
				registers[rd] = data;
			 end
			 
		 dataOut1 = registers[rs1];
		 dataOut2 = registers[rs2];
	 
	 end


endmodule
