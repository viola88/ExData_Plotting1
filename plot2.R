# Read Data and extract relevant data
hpc <- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings = c("?"))
Date2 <- as.Date(hpc$Date,"%d/%m/%Y")
hpc <- hpc[(year(Date2) == 2007) & (month(Date2) == 2) & (day(Date2)==1 | day(Date2)==2),]
xx <- do.call(paste0,hpc[c(1,2)])
xx <- sub("2007","2007 ",xx)
xx <- strptime(xx,"%d/%m/%Y %H:%M:%S")

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(xx,hpc$Global_active_power, type="l",axes = F, xlab = NA, ylab="Global Active Power (kilowatts)")
box()
axis(1,at = seq(from=xx[1],to=xx[2880],length.out=3),labels=c("Thu","Fri","Sat"),las=0)
axis(side=2)
dev.off()

