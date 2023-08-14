`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 3
//////////////////////////////////////////////////////////////////////////////////

module dataMeomory(
	input [31:0]WriteData, address,
	input clk, WriteSig, ReadSig,
	output reg [31:0]outData
    );
	 
	 reg [7:0]memory[1023:0];
	 
	 integer i;
	 initial begin
		for(i=0;i<1023;i=i+1) 
		begin
			memory[i] = 0;
		end
	 end
	 
	 always@(negedge clk)
	 begin
	 
		if (WriteSig == 1) 
		begin
			memory[address] = WriteData[7:0];
			memory[address+1] = WriteData[15:8];
			memory[address+2] = WriteData[23:16];
			memory[address+3] = WriteData[31:24];
		end
		if (ReadSig == 1) 
		begin
			outData = {memory[address+3], memory[address+2], memory[address+1], memory[address]};
		end
	 
	 end

endmodule
