`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 1
//////////////////////////////////////////////////////////////////////////////////

module ALUControlUnit(
	input [1:0]ALUOP,
	input [2:0]Function3bit,
	input [6:0]Function7bit,
	
	output reg [3:0]ALUCtr
    );
	 
	 always@(Function3bit, Function7bit, ALUOP)
	 begin
	 
	 //add
	 if(ALUOP == 'b00 & Function3bit == 'b000 & Function7bit == 'b0000000)
	 begin
		ALUCtr = 'b0000;
	 end
	 //addi
	 else if(ALUOP == 'b01 & Function3bit == 'b000)
	 begin
		ALUCtr = 'b0000;
	 end
	 //sub
	 else if(ALUOP == 'b00 & Function3bit == 'b000 & Function7bit == 'b0100000)
	 begin
		ALUCtr = 'b0001;
	 end
	 //xor
	 else if(ALUOP == 'b00 & Function3bit == 'b100 & Function7bit == 'b0000000)
	 begin
		ALUCtr = 'b0010;
	 end
	 //xori
	 else if(ALUOP == 'b01 & Function3bit == 'b100)
	 begin
		ALUCtr = 'b0010;
	 end
	 //or
	 else if(ALUOP == 'b00 & Function3bit == 'b110 & Function7bit == 'b0000000)
	 begin
		ALUCtr = 'b0011;
	 end
	 //ori
	 else if(ALUOP == 'b01 & Function3bit == 'b110)
	 begin
		ALUCtr = 'b0011;
	 end
	 //and
	 else if(ALUOP == 'b00 & Function3bit == 'b111 & Function7bit == 'b0000000)
	 begin
		ALUCtr = 'b0100;
	 end
	 //andi
	 else if(ALUOP == 'b01 & Function3bit == 'b111)
	 begin
		ALUCtr = 'b0100;
	 end
	 //not
	 else if(ALUOP == 'b00 & Function3bit == 'b011 & Function7bit == 'b0000000)
	 begin
		ALUCtr = 'b0101;
	 end
	 //sll
	 else if(ALUOP == 'b00 & Function3bit == 'b001 & Function7bit == 'b0000000)
	 begin
		ALUCtr = 'b0110;
	 end
	 //slli
	 else if(ALUOP == 'b01 & Function3bit == 'b001)
	 begin
		ALUCtr = 'b0110;
	 end
	 //srl
	 else if(ALUOP == 'b00 & Function3bit == 'b101 & Function7bit == 'b0000000)
	 begin
		ALUCtr = 'b0111;
	 end
	 //srli
	 else if(ALUOP == 'b01 & Function3bit == 'b101)
	 begin
		ALUCtr = 'b0111;
	 end
	 //slt
	 else if(ALUOP == 'b00 & Function3bit == 'b010 & Function7bit == 'b0000000)
	 begin
		ALUCtr = 'b1000;
	 end
	 //slti
	 else if(ALUOP == 'b01 & Function3bit == 'b010)
	 begin
		ALUCtr = 'b1000;
	 end
	 //sw-lw
	 else if(ALUOP == 'b10)
	 begin
		ALUCtr = 'b0000;
	 end
	 //beq
	 else if(ALUOP == 'b11)
	 begin
		ALUCtr = 'b0001;
	 end
	 
	 end


endmodule
