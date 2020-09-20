#estimate.memory(2,075,259*9)

tmp<-read.table("household_power_consumption.txt",sep = ";",header=TRUE)
data<- tmp[ which(tmp$Date=="1/2/2007" | tmp$Date=="2/2/2007"), ]