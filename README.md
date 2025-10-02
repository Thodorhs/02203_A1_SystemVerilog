# 02203 Assignment 1 – Greatest Common Divisor (SystemVerilog)

This repository contains a **SystemVerilog implementation** of **Assignment 1** in *02203 Design of Digital Systems (Fall 2025)* at DTU.  

The goal of this assignment is to design, simulate, and implement a digital circuit that computes the **Greatest Common Divisor (GCD)** of two positive integers using **Euclid’s algorithm**.  

The design flow follows a **top-down, simulation-based methodology** and targets the **Xilinx Nexys 4 DDR / Nexys A7 FPGA board**.

## Documentation

Read [Assignment tasks](assignment_1\02203-Assignment-1-2025.pdf) for understanting the assignment and [Report (PDF)](report\02203_Greatest_Common_Divisor_Report.pdf) for Full explanation of our implementation.

## Simulation and Tools

- **Simulation FPGA Synthesis and Testing:**  
  - Tool: [Xilinx Vivado](https://www.xilinx.com/products/design-tools/vivado.html)  
  - Target board: Nexys 4 DDR or Nexys A7  
  - Use `Nexys4DDR_gcd.xdc` for FPGA pin constraints  

- **(Optional) Simulation:**  
  - Use [Verilator](https://www.veripool.org/verilator/)  
  - Testbenches are included (`task1/gcd_tb.sv`, `task2/gcd_tb.sv`)  


## Notes
- This repo provides a **SystemVerilog** version of the assignment (original was in VHDL).