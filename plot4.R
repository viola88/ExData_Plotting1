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

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(xx,hpc$Global_active_power, type="l",axes = F, xlab = NA, ylab="Global Active Power")
box()
axis(1,at = seq(from=xx[1],to=xx[2880],length.out=3),labels=c("Thu","Fri","Sat"),las=0)
axis(side=2)

plot(xx,hpc$Voltage,col = "black", type="l", axes = F, xlab = "datetime", ylab = "Voltage")
box()
axis(1,at = seq(from=xx[1],to=xx[2880],length.out=3),labels=c("Thu","Fri","Sat"),las=0)
axis(side=2)

plot(xx,hpc$Sub_metering_1,col="black",type="l",axes = F, xlab = NA, ylab="Energy sub metering")
lines(xx,hpc$Sub_metering_2,col="red")
lines(xx,hpc$Sub_metering_3,col="blue")
box()
axis(1,at = seq(from=xx[1],to=xx[2880],length.out=3),labels=c("Thu","Fri","Sat"),las=0)
axis(side=2)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 2, col=c("black","red","blue"), cex=1, xjust = 2, seg.len=2, bty = "n")

plot(xx,hpc$Global_reactive_power, col = "black", type="l", axes = F, xlab = "datetime", ylab = "Global_reactive_power")
box()
axis(1,at = seq(from=xx[1],to=xx[2880],length.out=3),labels=c("Thu","Fri","Sat"),las=0)
axis(side=2)
dev.off()
