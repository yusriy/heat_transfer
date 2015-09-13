##
## Unsteady-state 2-Dimensional Heat Conduction Function
## Finite difference method
##
## Taken and modified for R from:
## 
## 1. Lorena Barba's lecture on solving Fourier equation using finite difference
##
## Author: Yusri Yusup, PhD
## Date created: 2015-09-12
##
## Note: Units are in SI

unsteady_state_conduc_2D <- function(rho = 500, #density [kg m-3]
                                     cp = 837,  #heat capacity [J kg-1 degC-1]
                                     k = 10000, #thermal conducvitiy [W m-1 degC-1] 
                                     dt = 0.01, #dt [s]
                                     init_temp = 20, #init. temp. [degC]
                                     temp_intro = 200, #boundary temp. [degC] 
                                     distancex = 20, #no. of distance iterations, x
                                     distancey = 20, #no. of distance iterations, y
                                     #Has to be 10x in meters [m]
                                     act_distx = 2,  #Actual dist x [m]
                                     act_disty = 2,  # Actual dist y [m]
                                     time_step = 200 #no. of time step iterations
) {
  
  
  # Calculate the thermal diffusivity of the material
  alpha = k / (rho * cp) # Thermal diffusivity, alpha = k / (rou * cp) [m2 s-1]
  
  # Numerical step constants, or grid specifications
  dx = act_distx/(distancex - 1) # Distance of each grid x in meters [m]
  dy = act_disty/(distancey - 1) # Distance of each grid y in meters [m]
  num_gridx = dt / dx^2
  num_gridy = dt / dy^2
  
  ## Numerical solution
  # 1. Setting up the matrix
  # 1.1 Create an NA-filled matrix to store results of temperature profile with distance
  temp = matrix(ncol = distancex, nrow = distancey)
  
  
  ## Add a progress bar
  pb <- txtProgressBar(min = 0, max = time_step, style = 3)
  
  ## 1.2 Setting up the initial conditions matrix
  # Up to 'distancex' and 'distancey' columns
  
  
  
  for (i in 1:distancex) { # Fill 'distance' columns second
    for(j in 1:distancey) {
      if (i == 1 | j == 1) {
        temp[i,j] = temp_intro # Boundary condition only at 1 point of the surface
      } else {
        temp[i,j] = init_temp # Initial condition of the slab
      }
    }
  }
    
  # 2. The implementation of the finite difference method
  # To store the values in time
  T_time <- list()
  
  for (n in 1:time_step) {
    tempn = temp # The condition before
    T_time[[n]] <- temp # To store the values with time
    for (i in 2:(distancex - 1)) {
      for (j in 2:(distancey - 1)) {
        temp[i,j] = tempn[i,j] + 
          (alpha * num_gridx * (tempn[i+1,j] - (2 * tempn[i,j]) + tempn[i-1,j])) +
          (alpha * num_gridy * (tempn[i,j+1] - (2 * tempn[i,j]) + tempn[i,j-1]))
      }
    }
    setTxtProgressBar(pb, n)
  }
  
  # Actual distance vectors of x and y
  distx <- 1:distancex * dx # To calculate actual distance x [m]
  disty <- 1:distancey * dy # To calculate actual distance y [m]
  # Actual time
  act_tim <- 1:time_step * dt # To calculate actual time [s]
  
  return(list(Temperature = T_time, x = distx, y = disty,
              time_step = time_step,time = act_tim)) 
  # Returns results as a dataframe and matrix of temp, distance, and time
  
} ## END OF FUNCTION


