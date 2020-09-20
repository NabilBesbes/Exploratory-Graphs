#train <- fread("train/X_train.txt")[, mean_std_indexes, with = FALSE]
#estimate.memory(2,075,259*9)

#tmp<-read.table("household_power_consumption.txt",sep = ";",header=TRUE)
#data<- tmp[ which(tmp$Date=="1/2/2007" | tmp$Date=="2/2/2007"), ]

data<-read.table("data.txt")

data$DT<-paste(data$Date,data$Time)

library('dplyr')

# First Plot
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
hist(data$Global_active_power, col="red")
title("Global Active Power")
dev.off()

# Plot 2 :



# Plot 3 :
png("plot3.png", width=640, height=480)
plot(data$N, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$N, data$Sub_metering_2, col="red")
lines(data$N, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()

# Plot 4 : 
png("plot4.png", width=640, height=480)
plot(data$N, data$Global_reactive_power, type="l", xlab="Date Time", ylab="Global_reactive_power")

dev.off()
