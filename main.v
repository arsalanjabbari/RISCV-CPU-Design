`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// fullname : Milad Nooraei
// student number : 9935701
// Computer Architecture Project
//////////////////////////////////////////////////////////////////////////////////

module RiscV(
	input clk
    );
	 
	wire hit;
	wire [31:0]nextPC_outFetch_inIF_ID_Register;
	wire [31:0]instruction_outFetch_inIF_ID_Register;
	
	wire [31:0]instruction_outIF_ID_Register;
	wire [31:0]nextPC_outIF_ID_Register_inID_EX_Register;
	
	wire [31:0]sign_extend_out;
	
	wire [1:0]alu_op_outControl_unit_inAlu_control;
	
	wire reg_write_outControl_unit;
	wire mem_to_reg_outControl_unit;
	wire mem_write_outControl_unit;
	wire mem_read_outControl_unit;
	wire branch_outControl_unit;
	wire [3:0] alu_ctr_outAlu_control;
	wire alu_src_outControl_unit;
	wire reg_dst_outControl_unit;
	
	wire [10:0] controlUnit_outControlUnit_inID_EX_Register;
	
	assign controlUnit_outControlUnit_inID_EX_Register	= {
			reg_dst_outControl_unit,      // 10
			alu_src_outControl_unit,      // 9
			alu_ctr_outAlu_control,       // 5, 6, 7, 8
			branch_outControl_unit,			// 4
			mem_write_outControl_unit,    // 3
			mem_read_outControl_unit,     // 2
			mem_to_reg_outControl_unit,   // 1
			reg_write_outControl_unit		// 0
	};
	
	wire [31:0]data_out1_outRegister_file_inID_EX_Register;
	wire [31:0]data_out2_outRegister_file_inID_EX_Register;
	
	wire [31:0]outNextPC_outID_EX_Register;
	wire [31:0]outSignExt_outID_EX_Register;
	wire [31:0]outRD1_outID_EX_Register;
	wire [31:0]outRD2_outID_EX_Register;
	wire [4:0]outrd_outID_EX_Register;
	wire [4:0]outrs2_outID_EX_Register;
	wire [10:0]outControlUnit_outID_EX_Register;
	
	wire [4:0]writeReg_outMux_2_1_regDst;
	
	wire [31:0]srcB_outMux_2_1_ALUsrc;
	
	wire [31:0]alu_out_outAlu_inEX_Mem_Register;
	wire zero_outAlu_inEX_Mem_Register;
	
	wire [31:0]outadder_outAdder_inEX_Mem_Register;
	
	wire [4:0]controlSignals_outID_EX_Register_inEX_Mem_Register;
	
	assign controlSignals_outID_EX_Register_inEX_Mem_Register = {
			outControlUnit_outID_EX_Register[4],  // 4
			outControlUnit_outID_EX_Register[3],  // 3
			outControlUnit_outID_EX_Register[2],  // 2
			outControlUnit_outID_EX_Register[1],  // 1
			outControlUnit_outID_EX_Register[0]	  // 0
	};
	
	wire [31:0] outALUout_outEX_Mem_Register;
	wire [31:0] outRD2_outEX_Mem_Register;
	wire [31:0] outPCBranch_outEX_Mem_Register;
	wire [4:0] outWriteReg_outEX_Mem_Register;
	wire [3:0] outControlSignals_outEX_Mem_Register;
	wire outZero_outEX_Mem_Register;
	
	wire isBranch;
	assign isBranch = zero_outAlu_inEX_Mem_Register && controlSignals_outID_EX_Register_inEX_Mem_Register[4];
	
	wire [31:0]outDataMemory_inMem_WB_Register;
	
	wire [1:0]controlSignals_outEX_Mem_Register_inMem_WB_Register;
	
	assign controlSignals_outEX_Mem_Register_inMem_WB_Register = {
			outControlUnit_outID_EX_Register[1],  // 1
			outControlUnit_outID_EX_Register[0]	  // 0
	};
	
	wire [31:0]outALUot_outMem_WB_Register;
	wire [31:0]outMemoryOut_outMem_WB_Register;
	wire [4:0]outWriteReg_outMem_WB_Register;
	wire [1:0]outControlSig_outMem_WB_Register;
	
	wire [31:0]outDataWriteBack;
	
	fetchState final_fetchState (
    .branchTarget(outadder_outAdder_inEX_Mem_Register), 
    .PCSource(isBranch), 
    .clk(clk), 
    .nextPC(nextPC_outFetch_inIF_ID_Register), 
    .instruction(instruction_outFetch_inIF_ID_Register), 
    .hit_result(hit)
		 );
	 
	IF_ID_Register final_IF_ID_Register (
		 .instruction(instruction_outFetch_inIF_ID_Register), 
		 .PCplusFour(nextPC_outFetch_inIF_ID_Register), 
		 .clk(clk), 
		 .hit(hit), 
		 .outInstruction(instruction_outIF_ID_Register), 
		 .outNextPC(nextPC_outIF_ID_Register_inID_EX_Register)
		 );

	SignExtendModule final_SignExtendModule (
		 .immediate(instruction_outIF_ID_Register[31:20]), 
		 .rd(instruction_outIF_ID_Register[11:7]), 
		 .opcode(instruction_outIF_ID_Register[6:0]), 
		 .result(sign_extend_out)
		 );
		 
	ControlUnit final_ControlUnit (
    .opcode(instruction_outIF_ID_Register[6:0]), 
    .regDST(reg_dst_outControl_unit), 
    .ALUSrc(alu_src_outControl_unit), 
    .MemToReg(mem_to_reg_outControl_unit), 
    .RegWrite(reg_write_outControl_unit), 
    .MemRead(mem_read_outControl_unit), 
    .MemWrite(mem_write_outControl_unit), 
    .Branch(branch_outControl_unit), 
    .ALUOP(alu_op_outControl_unit_inAlu_control)
    );
	 
	ALUControlUnit final_ALUControlUnit (
		 .ALUOP(alu_op_outControl_unit_inAlu_control), 
		 .Function3bit(instruction_outIF_ID_Register[14:12]), 
		 .Function7bit(instruction_outIF_ID_Register[31:25]), 
		 .ALUCtr(alu_ctr_outAlu_control)
		 );
	
	RegisterFile final_RegisterFile (
		 .rs1(instruction_outIF_ID_Register[19:15]), 
		 .rs2(instruction_outIF_ID_Register[24:20]), 
		 .rd(outWriteReg_outMem_WB_Register), 
		 .clk(clk), 
		 .writeSignal(outControlSig_outMem_WB_Register[0]), 
		 .data(outDataWriteBack), 
		 .dataOut1(data_out1_outRegister_file_inID_EX_Register), 
		 .dataOut2(data_out2_outRegister_file_inID_EX_Register)
		 );
	
	ID_EX_Register final_ID_EX_Register (
    .nextPC(nextPC_outIF_ID_Register_inID_EX_Register), 
    .signExt(sign_extend_out), 
    .RD1(data_out1_outRegister_file_inID_EX_Register), 
    .RD2(data_out2_outRegister_file_inID_EX_Register), 
    .rd(instruction_outIF_ID_Register[11:7]), 
    .rs2(instruction_outIF_ID_Register[24:20]), 
    .controlUnit(controlUnit_outControlUnit_inID_EX_Register), 
    .clk(clk), 
    .hit(hit), 
    .outNextPC(outNextPC_outID_EX_Register), 
    .outSignExt(outSignExt_outID_EX_Register), 
    .outRD1(outRD1_outID_EX_Register), 
    .outRD2(outRD2_outID_EX_Register), 
    .outrd(outrd_outID_EX_Register), 
    .outrs2(outrs2_outID_EX_Register), 
    .outControlUnit(outControlUnit_outID_EX_Register)
		 );
	
	Multiplexer2To1_5bit final_Multiplexer2To1_5bit (
		 .A(outrs2_outID_EX_Register), 
		 .B(outrd_outID_EX_Register), 
		 .select(outControlUnit_outID_EX_Register[10]), 
		 .result(writeReg_outMux_2_1_regDst)
		 );
	
	Multiplexer2To1 final_Multiplexer2To1 (
    .A(outRD2_outID_EX_Register), 
    .B(outSignExt_outID_EX_Register), 
    .select(outControlUnit_outID_EX_Register[9]), 
    .Out(srcB_outMux_2_1_ALUsrc)
    );
	
	ALU final_ALU (
		 .firstInput(outRD1_outID_EX_Register), 
		 .secondInput(srcB_outMux_2_1_ALUsrc), 
		 .alucontrol(outControlUnit_outID_EX_Register[8:5]), 
		 .ALUout(alu_out_outAlu_inEX_Mem_Register), 
		 .zero(zero_outAlu_inEX_Mem_Register)
		 );
	
	AdderModule32bit final_AdderModule32bit (
		 .A({outSignExt_outID_EX_Register[31:2], 2'b00}), 
		 .B(outNextPC_outID_EX_Register), 
		 .result(outadder_outAdder_inEX_Mem_Register)
		 );

	 
	EX_Mem_Register final_EX_Mem_Register (
    .ALUout(alu_out_outAlu_inEX_Mem_Register), 
    .RD2(outRD2_outID_EX_Register), 
    .PCBranch(outadder_outAdder_inEX_Mem_Register), 
    .writeReg(writeReg_outMux_2_1_regDst), 
    .controlSignals(controlSignals_outID_EX_Register_inEX_Mem_Register), 
    .clk(clk), 
    .hit(hit), 
    .zero(zero_outAlu_inEX_Mem_Register), 
    .outALUout(outALUout_outEX_Mem_Register), 
    .outRD2(outRD2_outEX_Mem_Register), 
    .outPCBranch(outPCBranch_outEX_Mem_Register), 
    .outWriteReg(outWriteReg_outEX_Mem_Register), 
    .outControlSignals(outControlSignals_outEX_Mem_Register), 
    .outZero(outZero_outEX_Mem_Register)
    );
	
	dataMeomory final_dataMeomory (
		 .WriteData(outRD2_outEX_Mem_Register), 
		 .address(outALUout_outEX_Mem_Register), 
		 .clk(clk), 
		 .WriteSig(outControlSignals_outEX_Mem_Register[3]), 
		 .ReadSig(outControlSignals_outEX_Mem_Register[2]), 
		 .outData(outDataMemory_inMem_WB_Register)
		 );
	
	Mem_WB_Register final_Mem_WB_Register (
    .ALUout(outALUout_outEX_Mem_Register), 
    .MemoryOut(outDataMemory_inMem_WB_Register), 
    .writeReg(outWriteReg_outEX_Mem_Register), 
    .controlSig(controlSignals_outEX_Mem_Register_inMem_WB_Register), 
    .clk(clk), 
    .hit(hit), 
    .outALUot(outALUot_outMem_WB_Register), 
    .outMemoryOut(outMemoryOut_outMem_WB_Register), 
    .outWriteReg(outWriteReg_outMem_WB_Register), 
    .outControlSig(outControlSig_outMem_WB_Register)
    );
	
	Multiplexer2To1 final_Multiplexer2To1_2 (
		 .A(outALUot_outMem_WB_Register), 
		 .B(outMemoryOut_outMem_WB_Register), 
		 .select(outControlSig_outMem_WB_Register[1]), 
		 .Out(outDataWriteBack)
		 );


endmodule
