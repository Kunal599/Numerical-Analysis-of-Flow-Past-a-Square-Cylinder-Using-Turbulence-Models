# Numerical-Analysis-of-Flow-Past-a-Square-Cylinder-Using-Turbulence-Models
Projects completed as part of the Advanced Computational Fluid Dynamics (ME634) course at IIT Kanpur. 

This project focuses on the numerical simulation of flow past a square cylinder that is centrally placed in a channel. The simulation is performed using a uniform grid mesh with 322x82 cells, and the obstacle surfaces, as well as the top and bottom surfaces of the channel, are treated as no-slip boundaries. The flow enters the channel with a uniform velocity uavu_{av}uav and a prescribed turbulence intensity of 10% at the inlet. The eddy viscosity at the inflow plane is set to νt/ν=10\nu_t / \nu = 10νt/ν=10.

The simulation employs three turbulence models:
1.	Standard k−ϵk-\epsilonk−ϵ Model
2.	Kato Launder (KaLa) Model
3.	RNG k−ϵk-\epsilonk−ϵ Model

The goal is to simulate the flow at a Reynolds number of 21400 and analyze the results in terms of:
•	Instantaneous velocity fields (using vorticity contours)
•	Strouhal number StStSt
•	Time-averaged drag coefficient CDC_DCD
•	Time-averaged lift coefficient CLC_LCL
•	Recirculation length Lr

Used code is multi-subroutine Fortran script and Matlab script is used for postprocessing 
