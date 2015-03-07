d<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data<-d
data$datetime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S") 

    
data <- subset(data, datetime >= '2007-2-1 00:00:00' & datetime <= '2007-2-2 23:59:59')

png("plot3.png", width = 480, height = 480)

plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lwd = 2 , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

