
## Chapter 4 example 9

# Constants
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


#p = 1 # DON'T KNOW WHAT THIS IS FOR!!!
#m = 6 # DON'T KNOW WHAT THIS IS FOR!!!

# To create a 2 times the 'mat_dim' by 'mat_dim' identity matrix
mat_dim = 6
A = 2 * diag(nrow = mat_dim) # Finite difference method, divide by half

# For loop to create a row with 20's
n = 6
#N = 1 # DON'T KNOW WHAT THIS IS FOR!!!

temp = matrix(nrow=mat_dim, ncol = n + 1)

for (j in 1:(n + 1)) { # Fill columns and then rows
  for (i in 1:mat_dim) { # Fill rows
    temp[i,j] = 20 # I THINK THIS IS THE INITIAL TEMPERATURE OF THE 1-D SLAB
  }
}

# dt is time, 4 time steps
#dt2 = 7
# Create a matrix to store results of calculations

B = matrix(nrow = 6, ncol = 6)

# Another for loop
# 200 is the temperature at the boundary and travels down the slab???
for (n in 1:7) {
  for (i in 1:4) {
    B[i+1,n] = temp[i+2,n] + temp[i,n]
    B[1,n] = temp[i+1,n] + 200
    B[6,n] = 2 * temp[i+1,n]
  }
  
  temperature = 0.5 * B[,n] # Finite difference method, divide by 2
  
  temp[,n+1] = temperature
  
}

