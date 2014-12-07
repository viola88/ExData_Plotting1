# rm(list = ls()) # to clear the workspace
# dev.off(dev.list()["RStudioGD"]) # close a\ll graphical devices
# setwd("D:/Documents/Einarbeitung/Coursera")

# Library for date and time
library(lubridate)

# Read data and transform date
hpc <- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings = c("?"))
Date2 <- as.Date(hpc$Date,"%d/%m/%Y")
hpc <- hpc[(year(Date2) == 2007) & (month(Date2) == 2) & (day(Date2)==1 | day(Date2)==2),]
xx <- do.call(paste0,hpc[c(1,2)])
xx <- sub("2007","2007 ",xx)
xx <- strptime(xx,"%d/%m/%Y %H:%M:%S")

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

