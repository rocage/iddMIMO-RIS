# Iterative Detection and Decoding for Multiuser Systems Based on MMSE Refinements With Active or Passive RIS #

This MATLAB script supports the results presented in the paper:
_Iterative Detection and Decoding for Multiuser Systems Based on MMSE Refinements with Active or Passive RIS_

Available at: https://ieeexplore.ieee.org/document/10747209

# Abstract of the Article

An iterative detection and decoding (IDD) scheme is proposed for multiuser multiple-antenna systems assisted by an active or a passive Reconfigurable Intelligent Surface (RIS). The proposed approach features an IDD strategy that incorporates Low-Density Parity-Check (LDPC) codes, RIS processing with refinements of soft information in the form of log likelihood ratios (LLRs) and truncation. Specifically, a minimum mean square error (MMSE) receive filter is used for refinement of LLRs and truncation at the RIS, and for soft interference cancellation at the receiver. An analysis of the proposed MMSE refinement is also devised along with a study of the computational complexity of the proposed and existing schemes. Simulation results demonstrate significant improvements in system capacity and bit error rate in the presence of block-fading channels.

# Content of Code Package

### This code was developed using MATLAB Live Script and consists of three main scripts: ###

- **main.mlx:** This script serves as the template for future implementations.
- **wcl01.mlx:** This script presents the results shown in Figure 01 (using parallel simulation).
- **wcl02.mlx:** This script presents the results shown in Figure 02 (using parallel simulation).

### Performance Tips: ###
To improve execution speed, especially for large-scale simulations, it is highly recommended to run the code in parallel. To do this, follow these steps:

- Replace the inner for loop with a parfor loop.
- Set the variable useParallel to _true_.

### Data Tracking: ###
For each SNR value, the code saves the results in the file nameofscript.mat. This enables users to monitor the progress of the simulation in real-time.

### Speed Optimization: ###
If you want to accelerate the simulation further, you can comment out the methods you don't need (e.g., 'MMSE_WORIS()'). The generatePlots4 function automatically generates plots for only the active methods.

### Flexible Packet Settings:  ###
Allows different numbers of packets for each SNR value.

# License and Referencing

This code package is licensed under the GPLv2 license. If you in any way use this code for research that results in publications, please cite our original article listed above.
