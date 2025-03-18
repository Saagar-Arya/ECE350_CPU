# Processor
## Saagar Arya (sa553)

## Overview
This project implements a five-stage, single-issue, 32-bit pipelined processor that meets the final specifications outlined in Project Checkpoint 4 (CP4). The processor is designed to efficiently handle data hazards and bypassing.

## Features
- **32 General-Purpose Registers**: Each register is 32 bits wide.
- **Wallace Tree Multiplier**: Provides efficient multiplication.
- **Carry-Lookahead Adder (CLA)**: Ensures fast arithmetic operations.
- **Pipelining**: Implements full pipeline functionality with bypassing and hazard handling.
- **Instruction Set Architecture (ISA)**: Supports all required ALU and control flow instructions.
- **Hazard Handling**: Implements bypass logic and stalls where necessary to avoid data hazards.

## Project Checkpoints
### CP4 Milestone 1: "Baby CPU"
- Implements basic ALU instructions without control flow or memory.
- Ensures correct operation of arithmetic instructions.
- Passed preliminary testing on Gradescope.

### CP4 Milestone 2: "Hazardous CPU"
- Implements the full ISA.
- Does not include bypassing or stalling logic, but successfully executes hazard-free test cases.
- Verified correctness and efficiency through register file extraction.

### CP4 Final: "Complete CPU"
- Implements full pipeline functionality, including bypassing and stall logic.
- Successfully executes all test cases, including those with data hazards.

### Pipeline Stages
1. **Instruction Fetch (F)**: Fetches the next instruction from memory.
2. **Instruction Decode (D)**: Decodes the instruction and reads from the register file.
3. **Execute (X)**: Performs arithmetic and logic operations.
4. **Memory Access (M)**: Handles memory operations.
5. **Write Back (W)**: Writes results back to the register file.

## Components & Operation
### 1. **Program Counter (PC)**
- Maintains the current instruction address.
- Supports branching, jumping, and pipeline stalls.
- Updates based on control signals such as `branch`, `jump`, `jal`, `jr`, and `bex_take`.
- Implements hazard detection to manage pipeline stalls and flushes.

### 2. **Fetch Stage**
- Retrieves instructions from `imem`.
- Stores fetched instructions and the incremented PC value into pipeline registers.
- Handles control flow changes by flushing the pipeline when necessary.

### 3. **Decode Stage**
- Decodes instruction opcodes to determine operation type (R-type, I-type, J-type, etc.).
- Identifies source and destination registers.
- Reads register values from `RegFile`.
- Passes decoded information to the next pipeline stage.

### 4. **Execute Stage**
- Performs ALU computations based on decoded instruction.
- Supports arithmetic, logic, shift, and comparison operations.
- Manages multiplication and division with a dedicated execution path.
- Implements forwarding and hazard detection to mitigate pipeline stalls.

### 5. **Memory Stage**
- Handles memory access instructions (`lw`, `sw`).
- Interfaces with `dmem` for reading and writing data.
- Ensures memory operations align with pipeline control logic.

### 6. **Write-Back Stage**
- Writes results back to the `RegFile` when necessary.
- Ensures proper forwarding to avoid unnecessary stalls.

## Key Features
- **Pipeline Control:** Implements hazard detection, forwarding, and stall mechanisms.
- **Branch & Jump Handling:** Supports conditional and unconditional control flow instructions.
- **Memory Access:** Facilitates seamless communication with external `dmem`.
- **Register Bypassing:** Optimizes execution by reducing unnecessary stalls.
- **Modular Design:** Separated concerns between pipeline stages and external memory/register interactions.

## External Interfaces
- **Instruction Memory (`imem`)**
  - `address_imem` (Output): Instruction address.
  - `q_imem` (Input): Instruction data.
- **Data Memory (`dmem`)**
  - `address_dmem` (Output): Data memory address.
  - `data` (Output): Data to write.
  - `wren` (Output): Write enable signal.
  - `q_dmem` (Input): Data read from memory.
- **Register File (`RegFile`)**
  - `ctrl_writeEnable` (Output): Enables register writes.
  - `ctrl_writeReg` (Output): Destination register.
  - `ctrl_readRegA/B` (Output): Source registers.
  - `data_writeReg` (Output): Data to write.
  - `data_readRegA/B` (Input): Data read from registers.

## Testing & Verification
- **Gradescope Testing**: Passed all required test cases for correctness and efficiency.

## Conclusion
This processor successfully meets the final CP4 specifications, ensuring efficient execution of instructions with proper hazard handling.

