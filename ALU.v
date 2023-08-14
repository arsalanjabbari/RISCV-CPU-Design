`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 2
//////////////////////////////////////////////////////////////////////////////////

module ALU(
	input [31:0]firstInput, secondInput,
	input [3:0]alucontrol,
	
	output [31:0]ALUout,
	output zero
    );
	 
	 assign ALUout = (alucontrol == 'b0000) ? (firstInput + secondInput) :    //and
				 (alucontrol == 'b0001) ? (firstInput - secondInput) :           //sub
				 (alucontrol == 'b0010) ? (firstInput ^ secondInput) :           //xor
				 (alucontrol == 'b0011) ? (firstInput | secondInput) :           //or
				 (alucontrol == 'b0100) ? (firstInput & secondInput) :           //and
				 (alucontrol == 'b0101) ? (~firstInput) :                        //not
				 (alucontrol == 'b0110) ? (firstInput << secondInput[4:0]) :     //shift left logical
				 (alucontrol == 'b0111) ? (firstInput >> secondInput[4:0]) :     //shift right logical
				 (alucontrol == 'b1000) ? ((firstInput < secondInput) ? 1 : 0)  ://set less than
				 -1;
				 
	assign zero = (ALUout == 0) ? 1 : 0;


endmodule
