# Robust Gauss-Newton Algorithm
This repository contins the Robust Gauss-Newton (RGN) algorithm developed by Youwei Qin, Prof. Dmitri Kavetski, and Prof. George Kuczera. 

When using RGN please cite the following articles:

Qin, Y., Kavetski, D., & Kuczera, G. (2018). A robust Gauss-Newton algorithm for the optimization of hydrological models: From standard Gauss-Newton to robust Gauss-Newton. Water
Resources Research, 54. https://doi.org/10.1029/2017WR022488

Qin, Y., Kavetski, D., & Kuczera, G. (2018). A robust Gauss-Newton algorithm for the optimization of hydrological models: Benchmarking against industry-standard algorithms. Water Resources Research, 54. https://doi.org/10.1029/2017WR022489

# Robust Gauss-Newton Algorithm Description
The Robust Gauss-Newton (RGN) algorithm is designed for solving optimization problems with sum of least squares objective function. RGN algorithm introduces three schematics of enhancements, the large sampling scale o capture large-scale features of objective function, best-sampling point scheme to take advantage of free infromation, and null-space jump scheme to escape near-flat region.

This repository includes two example for using RGN algorithm, a 2D Rosenbrock function example and a 5D HYMOD example. The folder "RGNcode" includes the Fortran95 source code of RGN algorithm (rgn.f90) and a module of most used constants (constantsMod.f90). The folder "ResonbrockExample" includes the driver code (rgnMain_Rosenbrock.f90 which calls rgn) for optimizing Rosenbrock function. The folder "HYMODexample" includes the driver code for optimizing HYMOD(rgnMain_Hymod.f90 which calls rgn) and HYMOD subroutine for optimizing.
