# Robust Gauss-Newton Algorithm
This repository contains the Robust Gauss-Newton (RGN) algorithm developed by Youwei Qin, Dmitri Kavetski and George Kuczera. 

When using RGN please cite the following articles:

Qin Y, Kavetski D, Kuczera G (2018) A robust Gauss-Newton algorithm for the optimization of hydrological models: From standard Gauss-Newton to robust Gauss-Newton. Water Resources Research, 54. https://doi.org/10.1029/2017WR022488

Qin Y, Kavetski D, Kuczera G (2018) A robust Gauss-Newton algorithm for the optimization of hydrological models: Benchmarking against industry-standard algorithms. Water Resources Research, 54. https://doi.org/10.1029/2017WR022489

# Robust Gauss-Newton Algorithm Description
The Robust Gauss-Newton (RGN) algorithm is designed for solving optimization problems with a sum of least squares objective function. The RGN algorithm introduces three heuristics to enhance its performance: (i) the large sampling scale scheme to capture large-scale features of the objective function, (ii) the best-sampling point scheme to take advantage of free information, and (iii) the null-space jump scheme to escape near-flat regions.

This repository includes two examples to illustrate the application of the RGN algorithm: optimisation of a 2D Rosenbrock function and calibration of the 5 parameter hydrological mdoel HYMOD. The following folders are included:

  - RGNcode: the RGN algorithm (rgn.f90) and an auxiliary module (constantsMod.f90)
  - RosenbrockExample: driver code (rgnMain_Rosenbrock.f90)
  - HYMODexample: driver code (rgnMain_Hymod.f90) and HYMOD model code

The implementation is in Fortran-95 and has been compiled and tested using gfortran and Intel Fortran. 

when compile with gfortran, first switch prompt window to destination folder, and then get the files compiled and linked with the following examples (Example 1: Rosenbrock_example; Example 2: Hymod_example)

Example 1:
>cd <Destination folder>\RGN_repo\Rosenbrock_example
>gfortran -c -ffree-line-length-none ../RGN_Code/constantsMod.f90 ../RGN_Code/rgn.f90 rgnMain_Rosenbrock.f90
>gfortran  -o Rosenbrock_example.exe *.o
>Rosenbrock_example.exe

Example 2:
>cd <Destination folder>\RGN_repo\HYMOD_example
>gfortran -c -ffree-line-length-none ../RGN_Code/constantsMod.f90 ../RGN_Code/rgn.f90 hydroDataMod.f90 hymod.f90 rgnMain_Hymod.f90
>gfortran  -o Hymod_example.exe *.o
>Hymod_example.exe
