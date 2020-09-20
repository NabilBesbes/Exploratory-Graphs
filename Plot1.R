source("Read_data.R")


library('dplyr')

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
hist(data$Global_active_power, col="red")
title("Global Active Power")
dev.off()
