`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 3
//////////////////////////////////////////////////////////////////////////////////

module PC(
	input [31:0]Address,
	input clk , hit,
	
	output reg [31:0]result
    );
	 
	 always@(posedge clk)
	 begin
		if(hit == 1)
			result = Address;
	 end

endmodule
