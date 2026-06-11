# Adaptive Precision-Aware ALU with Pipelined Multiplier and Workload Monitoring

## Project Overview

This project implements an Adaptive Precision-Aware Arithmetic Logic Unit (ALU) in Verilog using Vivado ML Edition.

The architecture dynamically adjusts computational precision based on workload statistics and integrates a pipelined multiplier, workload monitoring counters, and an adaptive controller.

## Features

* 8-bit Precision Mode
* 16-bit Precision Mode
* 32-bit Precision Mode
* Arithmetic Operations
* Logic Operations
* 2-Stage Pipelined Multiplier
* Workload Monitoring
* Automatic Precision Adaptation
* DSP48E1 Inference
* Vivado Synthesis Verified

## Architecture

adaptive_controller → precision_scaler → ALU / Multiplier

performance_monitor → adaptive_controller

## Modules

* alu_core
* precision_scaler
* pipelined_multiplier
* performance_monitor
* adaptive_controller
* adaptive_precision_alu_top

## Synthesis Results

Target FPGA:

* Xilinx XC7Z007S

Resource Usage:

* LUTs: 496
* Registers: 167
* DSP48E1: 4

## Verification

* Behavioral Simulation Completed
* Integrated System Verification Completed
* Vivado Synthesis Completed

## Author

Abishek VJ
