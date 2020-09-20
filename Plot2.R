source("Read_data.R")


library('dplyr')

png(filename = "plot2.png", width = 640, height = 480, units = "px", pointsize = 12,
    bg = "white")

data$N<-1:nrow(data)
plot(data$N, data$Global_active_power, type="l")

title("Global Active Power")
dev.off()
