##
## Script to plot the results of the 2 D heat conduction numerical solutions
##
## Author: Yusri Yusup, PhD
## Date created: 2015-09-12
##
## Note: I used ImageMagick to combine all the png's
## On the Mac, I typed in the console of the directory where the png's are:
## `$ convert *.png -delay 3 -loop 0 heat.gif`

require(colorspace)
require(lattice)

# 1. Get the results
source('R/unsteady_state_conduc_2D.R')
result<-unsteady_state_conduc_2D(time_step = 1000)

# You need to know the time step to plot
time_step <- result$time_step

## Add a progress bar
pb <- txtProgressBar(min = 0, max = time_step, style = 3)


# 2. The plots
# Setting up the grid for the levelplot function and adding it to the list
grid <- expand.grid(gridX = result$x, gridY = result$y)
result <- c(result,grid)

for (i in 1:time_step) {
  # creating a name for each plot file with leading zeros
  if (i < 10) {name = paste('0000',i,'heat2D.png',sep='')}
  if (i < 100 && i >= 10) {name = paste('000',i,'heat2D.png', sep='')}
  if (i >= 100) {name = paste('00', i,'heat2D.png', sep='')}
  if (i >= 1000) {name = paste('0', i,'heat2D.png', sep='')}
  
  png(filename = paste('figs/',name,sep=''), height = 360, width = 360)
  plot <- levelplot(Temperature[[i]] ~ gridX * gridY, data = result,
                    xlab='Distance x (m)', ylab = 'Distance y (m)',
                    col.regions = heat.colors(100,alpha=0.9),
                    main = paste('T (deg C), t = ', result$time[i],' s'))
  print(plot)
  dev.off()
  # Progress bar
  setTxtProgressBar(pb, i)
}

# 3. Cleaning up
rm(i,name,time_step,grid,pb,plot)

