##
## Unsteady-state 1-Dimensional Heat Conduction Function
## Finite difference method
##
## Taken and modified for R from:
## 1. 'Engineering Heat Transfer Scilab Solution' book, Chapter 4 example 9
## 2. Lorena Barba's lecture on solving Fourier equation using finite difference
##
## Author: Yusri Yusup, PhD
## Date created: 2015-09-04
##
## Note: Units are in SI

unsteady_state_conduc_1D <- function(rho = 500, #density [kg m-3]
                                     cp = 837,  #heat capacity [J kg-1 degC-1]
                                     k = 10000, #thermal conducvitiy [W m-1 degC-1] 
                                     dt = 0.01, #dt [s]
                                     init_temp = 20, #init. temp. [degC]
                                     temp_intro = 200, #boundary temp. [degC] 
                                     distance = 20, #no. of distance iterations
                                                    #Has to be 10x in meters [m]
                                     act_dist = 2,  #Actual dist [m]
                                     time_step = 100 #no. of time step iterations
                                     ) {
  
  
  # Calculate the thermal diffusivity of the material
  alpha = k / (rho * cp) # Thermal diffusivity, alpha = k / (rou * cp) [m2 s-1]
  
  # Numerical step constants, or grid specifications
  dx = act_dist/(distance - 1) # Distance of each grid in meters [m]
  num_grid = dt / dx^2

  ## Numerical solution
  # 1. Setting up the matrix
  # 1.1 Create an NA-filled matrix to store results of temperature profile with distance
  temp = matrix(ncol = distance, nrow = time_step+1)# Need to add the last row because
  # of n+1
  
  ## Add a progress bar
  pb <- txtProgressBar(min = 0, max = time_step + 1, style = 3)
  
  ## 1.2 Setting up the initial conditions matrix
  # Up to 'distance' columns because of 'time_step' rows
  for (i in 1:(time_step + 1)) { # Fill the rows 'time_step' first
    for (j in 1:distance) { # Fill 'distance' columns second
      if (j == 1) {
        temp[i,j] = temp_intro # Boundary condition
      } else {
        temp[i,j] = init_temp # Initial condition of the slab
      }
    }
  }
  
  # 1.3 Create a matrix to store results of calculations
  B = matrix(nrow = time_step, ncol = distance)
  
  # 2. The implementation of the finite difference method
  for (n in 1:time_step) {
    B[n,] = temp[n,]
    for (i in 2:(distance - 1)) {
      temp[n+1,i] = B[n,i] + 
        (alpha * num_grid * (B[n,i+1] - (2 * B[n,i]) + B[n,i-1]))
    }
    setTxtProgressBar(pb, n)
  }
  
  
  # Matrix of distance
  dist <- 1:distance * dx # To calculate actual distance [m]
  dist_matrix <- matrix(data = dist, ncol = distance, nrow = time_step + 1,
                        byrow = TRUE)
  
  # Matrix of time
  tim <- 0:time_step * dt # To calculate actual time
  time_matrix <- matrix(data = tim, ncol = distance, nrow = time_step + 1, 
                        byrow = FALSE)
  
  return(list(Temperature = temp, dist_matrix = dist_matrix,
              time_matrix = time_matrix, time_step = time_step)) 
  # Returns results as a dataframe and matrix of temp, distance, and time
  
} ## END OF FUNCTION


