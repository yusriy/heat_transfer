##
## Unsteady-state 1-Dimensional Heat Conduction Problem
## Taken from 'Engineering Heat Transfer Scilab Solution' book, Chapter 4 example 9
##

#### Constants ####
rou = 0.5 * 1000 # Density?
cp = 837 # Heat capacity
k = 0.128 # Thermal conductivity
alpha = 0.049E-5 # Thermal diffusivity, k/(rou*cp)
# Numerical step constants? Grids specifications?
Fo = 0.5
dx = 0.05
dt = Fo * (dx)^2 / alpha

## The time increment is %.3f hr
## How to printf in R?
dt/3600


#### Numerical solution ####

#p = 1 # DON'T KNOW WHAT THIS IS FOR!!!
#m = 6 # DON'T KNOW WHAT THIS IS FOR!!!
# To create a 2 times the 'mat_dim' by 'mat_dim' identity matrix
# But not used, since I resorted a shortcut below.
#mat_dim = 6
#A = 2 * diag(nrow = mat_dim) # Finite difference method, divide by half

# Initial conditions
init_temp = 20 # deg C
temp_intro = 200 # deg C, temperature introduced into the solid

## For loop to create a row with 20's
# Column is time step (7 time steps)
# Row is distance
time_step = 100 # Time step
distance = 6 # Distance

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
    B[i + 1, n] = temp[i + 2, n] + temp[i, n]
    B[1, n] = temp[i + 1, n] + temp_intro
    B[6, n] = 2 * temp[i + 1, n]
  }
  
  temperature = 0.5 * B[,n] # Finite difference method, divide by 2, shortcut method
  temp[, n + 1] = temperature
  #plot(temp[,1], type = 'l', xlab = 'Temperature', ylab = 'Distance',
  #     ylim=c(0,150))
  #lines(temp[,n], type = 'l')
}

