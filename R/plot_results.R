# Plot at time = 0
plot(result$dist_matrix[,1],result$Temperature[,1],
     type='l',ylab='Temperature (deg C)',xlab='Distance (m)',main='t = 0 s',
     ylim = c(0,120))

# Plot at time = 1
plot(result$dist_matrix[,2],result$Temperature[,2],
     type='l',ylab='Temperature (deg C)',xlab='Distance (m)',main='t = 1 s',
     ylim = c(0,120))

# Plot at time = 2
plot(result$dist_matrix[,3],result$Temperature[,3],
     type='l',ylab='Temperature (deg C)',xlab='Distance (m)',main='t = 2 s',
     ylim = c(0,120))

# Plot at time = 3
plot(result$dist_matrix[,4],result$Temperature[,4],
     type='l',ylab='Temperature (deg C)',xlab='Distance (m)',main='t = 3 s',
     ylim = c(0,120))

# Plot at time = 4
plot(result$dist_matrix[,5],result$Temperature[,5],
     type='l',ylab='Temperature (deg C)',xlab='Distance (m)',main='t = 4 s',
     ylim = c(0,120))

# Plot at time = 5
plot(result$dist_matrix[,6],result$Temperature[,6],
     type='l',ylab='Temperature (deg C)',xlab='Distance (m)',main='t = 5 s',
     ylim = c(0,120))

# Plot at time = 6
plot(result$dist_matrix[,7],result$Temperature[,7],
     type='l',ylab='Temperature (deg C)',xlab='Distance (m)',main='t = 6 s',
     ylim = c(0,120))

# Plot at time = 7
plot(result$dist_matrix[,8],result$Temperature[,8],
     type='l',ylab='Temperature (deg C)',xlab='Distance (m)',main='t = 7 s',
     ylim = c(0,120))
