`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture HomeWork 3
//////////////////////////////////////////////////////////////////////////////////

module instructionCache(
    input [31:0]address,
    input [127:0]inputData,
    input clk,
	 
    output reg [31:0]outData,
    output reg hit
	 );
	 


	reg [153:0]cache[7:0];       //Defining the cache
	reg [127:0]lastInputData;    //Saving the last input data
	reg [153:0]thisBlock;        //Saving this block 
	

	//Initialization of valid bit
	integer i;
	initial begin
		for (i=0;i<=7;i=i+1)
			cache[i][153] = 0;
	end
	
	always @(negedge clk) 
	begin
		thisBlock = cache[address[6:4]];
		if (thisBlock[152:128] == address[31:7] && thisBlock[153] == 1) 
			begin
				hit = 1;
				if(address[3:2] == 0) 
					outData = thisBlock[31:0];      
				else if(address[3:2] == 1) 
					outData = thisBlock[63:32]; 
				else if(address[3:2] == 2) 
					outData = thisBlock[95:64];
				else if(address[3:2] == 3) 
					outData = thisBlock[127:96];
		
			end
		
		else //miss
			hit = 0;

		if(lastInputData !== inputData)
			begin
				cache[address[6:4]][127:0] = inputData;       //Updating cache
				cache[address[6:4]][152:128] = address[31:7]; //Updating tag
				cache[address[6:4]][153] = 1;                 //Setting valid bit
				lastInputData = inputData;                    //Update last data input
			end
			
	end

endmodule
