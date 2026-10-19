# 32 Bit RISC Datapath and ALU Execution Core


## Overview

A synchronous 32 bit processor execution core modeled in SystemVerilog, compiled and synthesized using Intel Quartus Prime, and physically verified on an Altera Cyclone IV E FPGA using the Terasic DE2 115 development board[cite: 25, 27, 28, 30].


The project implements an R type RISC datapath architecture featuring a dual read multiport register file, a dedicated arithmetic functional unit, and an active low seven segment output decoder for real time hardware telemetry[cite: 12, 13, 27, 28].


## Architectural Modules

The design is organized into modular SystemVerilog blocks instantiated within a structural top level wrapper:


* Register File (register_file.sv): Contains 32 general purpose 32 bit registers[cite: 10, 27]. Features dual asynchronous read ports (RD1, RD2) for immediate source operand fetch and a single synchronous write port (WD3) clocked on the rising edge[cite: 10, 27]. Includes active high synchronous reset logic that initializes register values to their index for simulation validation[cite: 27].


* Arithmetic Logic Unit (ALU.sv): Performs 32 bit arithmetic operations driven by a 3 bit control word[cite: 10, 28]. Decodes control signals to execute addition (010) or subtraction (110) while driving results directly to the datapath write back bus[cite: 10, 13, 28].


* Top Level Integration (top.sv): Coordinates signal buses between the register file and the ALU core[cite: 11, 20]. Maps input control lines from physical board switches to trigger instruction operations and routes register output to the display subsystem[cite: 20, 27, 28, 30].


* Display Subsystem (display.sv): Decodes internal binary bus values into active low seven segment representations to display register probe values directly on physical board hardware[cite: 14, 22, 27].


## Instruction Set Execution

The datapath implements R type single cycle instruction operations:


* ADD (Control 3'b010): Reg[rs] plus Reg[rt] written back into Reg[rd]. Dual register read, 32 bit integer addition, register write back[cite: 9, 13, 28].


* SUB (Control 3'b110): Reg[rs] minus Reg[rt] written back into Reg[rd]. Dual register read, 32 bit integer subtraction, register write back[cite: 10, 13, 28].


## Functional Verification

Simulation and physical hardware validation were performed to confirm arithmetic correctness:


* ModelSim Waveform Simulation: Verified timing response across back to back operation switching[cite: 29]. Confirmed that loading source registers 5 and 2 with an ADD instruction drives 7 to the write register bus, and loading source registers 5 and 3 with a SUB instruction drives 2 without logic glitching[cite: 14, 29].


* FPGA Physical Bring Up: Successfully routed, compiled, and programmed onto the Altera Cyclone IV E EP4CE115 device[cite: 30]. Arithmetic execution was verified on the physical test bench using onboard toggles and monitored directly through the seven segment output LEDs[cite: 30, 31, 32].


## EDA Tools and Target Hardware

* Hardware Description Language: SystemVerilog[cite: 25, 27]


* Synthesis and Implementation: Intel Quartus Prime Lite Edition[cite: 28]


* Functional Simulation: ModelSim Altera Edition[cite: 29]


* Target Silicon: Altera Cyclone IV E (EP4CE115F29C7) on Terasic DE2 115[cite: 4, 30]
