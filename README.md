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

