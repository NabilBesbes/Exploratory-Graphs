source("Read_data.R")


library('dplyr')

data$N<-1:nrow(data)

png("plot3.png", width=640, height=480)
plot(data$N, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$N, data$Sub_metering_2, col="red")
lines(data$N, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
