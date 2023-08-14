`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 3
//////////////////////////////////////////////////////////////////////////////////

module instructionMem(
    input [31:0]address,
    input clk,
	 
    output reg [127:0]outData  
    );

    reg [7:0]memory[1023:0];
    reg [31:0]temp_address;

   integer counter = 0;
	
	initial $readmemb("input.txt", memory, 0, 1023);

	always @(address) counter = 0;

	always @(negedge clk) 
		begin

			if (counter == 4) begin
				temp_address = {address[31:4], 4'b0000};
				outData = {memory[temp_address + 12], memory[temp_address + 13], memory[temp_address + 14], memory[temp_address + 15], 
							  memory[temp_address + 8], memory[temp_address + 9], memory[temp_address + 10], memory[temp_address + 11],
						     memory[temp_address + 4], memory[temp_address + 5], memory[temp_address + 6], memory[temp_address + 7],
						     memory[temp_address], memory[temp_address + 1], memory[temp_address + 2], memory[temp_address + 3]};
				counter = 0;
			end
			
			counter = counter + 1; 
		
		end

endmodule
