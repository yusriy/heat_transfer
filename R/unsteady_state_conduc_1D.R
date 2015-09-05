##
## Unsteady-state 1-Dimensional Heat Conduction Function
## Taken and modified for R from:
## 'Engineering Heat Transfer Scilab Solution' book, Chapter 4 example 9
##
## Author: Yusri Yusup, PhD
## Date: 2015-09-04
##

unsteady_state_conduc_1D <- function(rho = 500, cp = 837, k = 0.128,
                                     dt = 1, dx = 0.1,  # dx in m (any units)
                                                        # dt in s (any units)
                                     init_temp = 20, temp_intro = 200,
                                     distance = 6, time_step = 7) {
  
  ## Constants (SI units)
  
  # rou = Density [kg m-3]
  # cp = Heat capacity [J deg C-1 kg-1]
  # k = Thermal conductivity [W m-1 deg C-1]
  
  alpha = k / (rho * cp) # Thermal diffusivity, k/(rou*cp) [m2 s-1]
  
  ## Numerical step constants, or grid specifications
  num_grid = dt / dx^2

  ## Numerical solution
  
  #p = 1 # DON'T KNOW WHAT THIS IS FOR!!!
  #m = 6 # DON'T KNOW WHAT THIS IS FOR!!!
  # To create a 2 times the 'mat_dim' by 'mat_dim' identity matrix
  # But not used, since I resorted a shortcut below.
  #mat_dim = 6
  #A = 2 * diag(nrow = mat_dim) # Finite difference method, divide by half
  
  # Initial conditions
  # init_temp = 20 # deg C
  # temp_intro = 200 # deg C, temperature introduced into the solid
  
  ## For loop to create a row with 20's
  # Column is time step (10 time steps)
  # Row is distance
  # time_step = 10 # Time step
  # distance = 6 # Distance
  
  # Create an NA-filled matrix to store results of temperature profile with distance
  temp = matrix(nrow = distance, ncol = time_step + 1)  # An extra time step because
  # start from time step = 0
  
  # Up to 7 columns because of 7 time steps
  for (j in 1:time_step) { # Fill columns and then rows
    for (i in 1:distance) { # Fill rows
      temp[i,j] = init_temp # I THINK THIS IS THE INITIAL TEMPERATURE OF THE 1-D SLAB
    }
  }
  
  
  # Create a matrix to store results of calculations
  B = matrix(nrow = distance, ncol = time_step )
  
  # Another for loop
  # 200 is the temperature at the boundary and travels down the slab
  for (n in 1:time_step) {
    for (i in 1:(distance - 2)) { # The number of dimensions would be the same in the end
      B[i + 1, n] = alpha * num_grid * temp[i + 2, n] + temp[i, n]
      B[1, n] = temp[i + 1, n] + temp_intro     # 1 because the beginning distance
      B[6, n] = alpha * num_grid * 2 * temp[i + 1, n] # 6 because use the the 
                                                      # last distance at the end
    }
    
    temperature = 0.5 * B[,n] # Finite difference method, divide by 2, shortcut method
    temp[, n + 1] = temperature
  }
  
  
  # Matrix of distance
  dist <- 1:distance * dx # To calculate actual distance
  dist_matrix <- matrix(data = dist, ncol = time_step + 1, nrow = distance)
  
  # Matrix of time
  tim <- (0:(time_step)) * dt # To calculate actual time
  time_matrix <- matrix(data = tim, ncol = time_step + 1, nrow = distance, 
                        byrow = TRUE)
  
  df <- cbind(dist,temp)  # To combine distance and temperature and make into a data
  df <- as.data.frame(df) # frame
  
  return(list(df=df, Temperature = temp, dist_matrix = dist_matrix,
              time_matrix = time_matrix)) 
  # Returns results as a dataframe and matrix of temp, distance, and time
  
} ## END OF FUNCTION


