`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 1
//////////////////////////////////////////////////////////////////////////////////

module ControlUnit(
	input [6:0]opcode,
	
	output reg regDST,
	output reg ALUSrc,
	output reg MemToReg,
	output reg RegWrite,
	output reg MemRead,
	output reg MemWrite,
	output reg Branch,
	output reg [1:0]ALUOP
    );
	 
	 always@(opcode)
	 begin
	 
		if(opcode == 'b0110011)            //R-Type
		begin
			regDST = 1;
	      ALUSrc = 0;
			MemToReg = 0;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
	      Branch = 0;
	      ALUOP = 'b00;
		end
		
		else if(opcode == 'b0010011)       //I-Type
		begin
			regDST = 1;
	      ALUSrc = 1;
			MemToReg = 0;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
	      Branch = 0;
	      ALUOP = 'b01;
		end
		
		else if(opcode == 'b0000011)       //lw
		begin
			regDST = 1;
	      ALUSrc = 1;
			MemToReg = 1;
			RegWrite = 1;
			MemRead = 1;
			MemWrite = 0;
	      Branch = 0;
	      ALUOP = 'b10;
		end
		
		else if(opcode == 'b0100011)       //sw
		begin
			regDST = 0;
	      ALUSrc = 1;
			MemToReg = 0;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 1;
	      Branch = 0;
	      ALUOP = 'b10;
		end
		
		else if(opcode == 'b1100011)       //Branch
		begin
			regDST = 0;
	      ALUSrc = 0;
			MemToReg = 0;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 0;
	      Branch = 1;
	      ALUOP = 'b11;
		end
	 
	 end


endmodule
