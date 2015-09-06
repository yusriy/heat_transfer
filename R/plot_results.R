##
## Script to plot the results of the numerical solutions
##
## Author: Yusri Yusup, PhD
## Date created: 2015-09-05
##
## Note: I used ImageMagick to combine all the png's
## On the Mac, I typed in the console of the directory where the png's are:
## `$ convert *.png -delay 3 -loop 0 heat.gif`

# 1. Get the results
source('R/unsteady_state_conduc_1D.R')
result<-unsteady_state_conduc_1D()

# You need to know the time step to plot
time_step <- result$time_step + 1 # Always an extra step after

## Add a progress bar
pb <- txtProgressBar(min = 0, max = time_step, style = 3)

# 2. The plots
for (i in 1:time_step) {
  # creating a name for each plot file with leading zeros
  if (i < 10) {name = paste('0000',i,'heat.png',sep='')}
  if (i < 100 && i >= 10) {name = paste('000',i,'heat.png', sep='')}
  if (i >= 100) {name = paste('00', i,'heat.png', sep='')}
  if (i >= 1000) {name = paste('0', i,'heat.png', sep='')}
  
  png(filename = paste('figs/',name,sep=''), height = 350, width = 400)
  plot(result$dist_matrix[i,],result$Temperature[i,], type = 'l',
       ylab = 'Temperature (deg C)', xlab = 'Distance (m)', 
       main = paste('t = ', result$time_matrix[i,1], ' s'),
       ylim = c(-5,200))
  dev.off()
  # Progress bar
  setTxtProgressBar(pb, i)
}

# 3. Cleaning up
rm(i,name,time_step)

