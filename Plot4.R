source("Read_data.R")


library('dplyr')

data$N<-1:nrow(data)

png("plot4.png", width=640, height=480)
plot(data$N, data$Global_reactive_power, type="l", xlab="Date Time", ylab="Global_reactive_power")

dev.off()
