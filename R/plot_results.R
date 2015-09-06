# Get the results
source('R/unsteady_state_conduc_1D.R')
result<-unsteady_state_conduc_1D()

# You need to know the time step to plot
time_step <- result$time_step + 1 # Always an extra step after

# The plots
for (i in 1:time_step) {
  png(filename = paste('figs/heat',i,'.png',sep=''), height = 200, width = 400)
  plot(result$dist_matrix[i,],result$Temperature[i,], type = 'l',
       ylab = 'Temperature (deg C)', xlab = 'Distance (m)', 
       main = paste('t = ', result$time_matrix[i,1], ' s'),
       ylim = c(-5,200))
  dev.off()
}

rm(i)

