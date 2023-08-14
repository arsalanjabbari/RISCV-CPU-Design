`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 1
//////////////////////////////////////////////////////////////////////////////////

module SignExtendModule(
	input [11:0]immediate,
	input [4:0]rd,
	input [6:0]opcode,
	
	output reg[31:0] result
);
	 
	always @(*) begin
		if (opcode == 7'b0110011) //R-type
			result = {{20{immediate[11]}}, immediate[11:0]};
		else if (opcode == 7'b1100011) //Branch
			result = {{20{immediate[11]}}, immediate[11], rd[0], immediate[10:5], rd[4:1]};
		else if (opcode == 7'b0000011) //Load
			result = {{20{immediate[11]}}, immediate[11:0]};
		else if (opcode == 7'b0100011) //Store
			result = {{20{immediate[11]}}, immediate[11:5], rd};
		else if (opcode == 7'b0010011) //Immediate
			result = {{20{immediate[11]}}, immediate[11:0]};
		else //Default
			result = 0;
	end

endmodule
