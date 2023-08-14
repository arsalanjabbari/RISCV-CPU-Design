# RISCV-CPU-Design

Welcome to the **RISCV-CPU-Design** project repository! In this project, you will be tasked with implementing pipeline registers and connecting all the modules you've created so far to build a complete RISC-V processor. The successful completion of this project will result in a functional MIPS processor, and you'll have the opportunity to gain bonus points by handling hazards. To guide you through the process, we've provided instructions, examples, and all the necessary files.

## Table of Contents

- [Introduction](#introduction)
- [Project Overview](#project-overview)
- [Features](#features)
- [Getting Started](#getting-started)
- [Conclusion](#conclusion)

## Introduction

Congratulations on your progress so far! In this phase of the project, you will work on implementing pipeline registers and interconnecting the various modules you've developed in previous stages. The ultimate goal is to create a functional MIPS processor. While handling hazards is optional, it can earn you bonus points and enhance the robustness of your design. You will be provided with a set of instructions that you should upload into your instruction memory. The execution of these instructions will significantly impact your project's score.

## Project Overview

Your project will involve the following main steps:

1. Implement pipeline registers.
2. Connect all previously created modules.
3. Create a MIPS processor using instantiated modules and pipeline registers.
4. Optionally, handle hazards to enhance the project's quality.

## Features

- **Pipeline Registers:** Implement pipeline registers to facilitate the flow of data between different stages of the processor pipeline.
- **Module Integration:** Connect all modules developed in previous phases to create a comprehensive MIPS processor.
- **Instruction Execution:** Upload a set of instructions into the instruction memory and ensure their correct execution to achieve a functional processor.
- **Hazard Handling (Bonus):** Implement hazard handling mechanisms to improve the overall efficiency and correctness of your processor.

## Getting Started

To get started with the project, follow these steps:

1. Compile the provided instructions into machine code.
2. Set up the initial instruction memory with the compiled machine code.
3. Create a module (`mips.v` or similar) to instantiate and interconnect all your modules and pipeline registers.
4. Ensure that your `mips` module has a single `clk` input and use `$display` or `$monitor` for output.

Here's an example of an instruction without hazards (you can use your own set of instructions):

```assembly
ADDI $t0, $t1, 100
```

Compile this instruction into machine code and add it to your initial instruction memory.

## Conclusion

By completing the **RISCV-CPU-Design** project, you'll have gained hands-on experience in building a functional MIPS processor. Through the implementation of pipeline registers and module integration, you'll have created a complex system capable of executing instructions. Don't forget that handling hazards, though optional, can significantly enhance your project's quality and your understanding of processor design.

Feel free to explore and expand upon the concepts introduced in this project. Good luck, and happy coding!

## Files

The following files are provided for your project:

- `ALU.v`
- `ALUControlUnit.v`
- `AdderModule32Bit.v`
- `ControlUnit.v`
- `EX_Mem_Register.v`
- `ID_EX_Register.v`
- `IF_ID_Register.v`
- `Mem_WB_Register.v`
- `Multiplexer2To1.v`
- `Multiplexer2To1_5bit.v`
- `PC.v`
- `RegisterFile.v`
- `main.v`
- `SignExtend.v`
- `DataMemory.v`
- `FetchState.v`
- `InstructionCache.v`
- `InstructionMem.v`

These files contain the building blocks for your MIPS processor, and you'll be using them to complete the project.