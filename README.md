# RGN_trial
A trail version of robust Gauss-Newton algorithm by Youwei Qin, Dmitri Kavetski, and Prof. George Kuczera from the paper titled A Robust Gauss-Newton algorithm for the optimization of hydrological models: From standard Gauss-Newton to Robust Gauss-Newton, sumbitted to Water Resources Research

# RGN_trial details
This trail includes two examples to verify the robust Gauss-Newton algorithm, a 2D Rosenbrock function example, and a 5D HYMOD example. 

The folder RGNcode include the Fortran95 source code of rgn (rgn.f90) and a module of most used constants(constantsMod.f90).

The folder ResonbrockExample includes the main code (rgnMain_Rosenbrock.f90 which calls rgn) for optimizing Rosenbrock function

The folder HYMODexample includes the main code (rgnMain_Hymod.f90 which calls rgn), and HYMOD subroutine for optimizing
