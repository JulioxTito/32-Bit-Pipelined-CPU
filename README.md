# 32 Bit RISC Datapath and ALU Execution Core


## Overview

A synchronous 32 bit processor execution core modeled in SystemVerilog, compiled and synthesized using Intel Quartus Prime, and physically verified on an Altera Cyclone IV E FPGA using the Terasic DE2 115 development board[cite: 25, 27, 28, 30].


The project implements an R type RISC datapath architecture featuring a dual read multiport register file, a dedicated arithmetic functional unit, and an active low seven segment output decoder for real time hardware telemetry[cite: 12, 13, 27, 28].


```text
                    +--------------------+
                    |  Instruction Bus   |
                    +---------+----------+
                              |
       +----------------------+----------------------+
       |                      |                      |
       v (rs)                 v (rt)                 v (rd)
+--------------+       +--------------+              |
| Register A1  |       | Register A2  |              |
+-------+------+       +-------+------+              |
        |                      |                     |
        v                      v                     |
+---------------+      +---------------+             |
|   ReadPort1   |      |   ReadPort2   |             |
|     (RD1)     |      |     (RD2)     |             |
+-------+-------+      +-------+-------+             |
        |                      |                     |
        +------------+         |                     |
                     |         |                     |
                     v         v                     |
                 +-----------------+                 |
                 |   32 Bit ALU    |                 |
                 | (ADD:010/SUB:110|                 |
                 +--------+--------+                 |
                          |                          |
                          v (ALUResult)              |
                          |                          |
                          +-----------+              |
                                      |              |
                                      v              v
                              +--------------------------+
                              |     WritePort3 (WD3)     |
                              |   Register File [rd]     |
                              +--------------------------+
