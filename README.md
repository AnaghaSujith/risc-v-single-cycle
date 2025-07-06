# risc-v-single-cycle
This project implements a synthesizable single-cycle RISC-V processor that supports a subset of RV32I instructions (R-type, I-type, and S-type). Designed entirely in Verilog, the processor executes one instruction per clock cycle and includes modules for instruction memory, data memory, register file, ALU, and control logic.
#  RISC-V Single-Cycle Processor (RV32I Subset)

This is a Verilog implementation of a **single-cycle RISC-V processor**, supporting core RV32I instructions (R, I, S-types), synthesized using Vivado and verified with a custom testbench.

---

##  Features

- Implements R-type, I-type (arithmetic & load), and S-type (store) instructions
- Register File, ALU, Instruction Memory, Data Memory
- Single-cycle design for easy simulation and understanding
- Synthesizable on Xilinx FPGA (Vivado tested)
- Output includes ALU result, register values, program counter, etc.

---

##  Repository Structure

| Folder         | Description                                        |
|----------------|----------------------------------------------------|
| `src/`         | RTL files for processor core and submodules        |
| `testbench/`   | Simulation testbench                               |
| `sim/`         | Waveform and simulation output logs                |
| `vivado_project/` | Vivado synthesis results and DRC screenshots     |
| `docs/`        | Diagrams and architecture explanation              |

---

##  Screenshots

###  Resource Utilization

![Utilization](vivado_project/screenshots/resource_utilization.png)

###  Thermal Report

![Temperature](vivado_project/screenshots/temp_violation.png)

###  DRC Errors

![Multiple Driver Error](vivado_project/screenshots/multiple_driver_error.png)

---

##  Tools Used

- **Vivado 2024.1** – RTL synthesis and implementation
- **Verilog** – Hardware description
- **GTKWave** – Optional waveform viewer


---

##  Instruction Example Output
 run 1000ns
- Time: 0 | PC: 00000000 | instr: 00940333 | x5:          x | x6:          x | reg_write: 1
- Time: 20000 | PC: 00000000 | instr: 00940333 | x5:          5 | x6:          6 | reg_write: 1
- Time: 60000 | PC: 00000004 | instr: 413903b3 | x5:          5 | x6:         17 | reg_write: 1
- Time: 100000 | PC: 00000008 | instr: 035a02b3 | x5:          5 | x6:         17 | reg_write: 1
- Time: 140000 | PC: 0000000c | instr: 017b4e33 | x5:         65 | x6:         17 | reg_write: 1
- Time: 180000 | PC: 00000010 | instr: 019c1eb3 | x5:         65 | x6:         17 | reg_write: 1
- Time: 220000 | PC: 00000014 | instr: 01bd5f33 | x5:         65 | x6:         17 | reg_write: 1
- Time: 260000 | PC: 00000018 | instr: 00d67fb3 | x5:         65 | x6:         17 | reg_write: 1
- Time: 300000 | PC: 0000001c | instr: 00f768b3 | x5:         65 | x6:         17 | reg_write: 1
- Time: 340000 | PC: 00000020 | instr: 00508513 | x5:         65 | x6:         17 | reg_write: 1
- Time: 380000 | PC: 00000024 | instr: 00f0c593 | x5:         65 | x6:         17 | reg_write: 1
- Time: 420000 | PC: 00000028 | instr: 00c16613 | x5:         65 | x6:         17 | reg_write: 1
- Time: 460000 | PC: 0000002c | instr: 0081e693 | x5:         65 | x6:         17 | reg_write: 1
- Time: 500000 | PC: 00000030 | instr: 00205023 | x5:         65 | x6:         17 | reg_write: 0
- STORE: Wrote 00000002 to addr 00000000
- Time: 540000 | PC: 00000034 | instr: 00310003 | x5:         65 | x6:         17 | reg_write: 1
- LOAD: Read 00000002 from addr 00000000
- Time: 580000 | PC: 00000038 | instr: 00000033 | x5:         65 | x6:         17 | reg_write: 1
- HALT: Reached NOP at PC=00000038
