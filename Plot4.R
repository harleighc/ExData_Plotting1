d<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data<-d

data$datetime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S") 



data <- subset(data, datetime >= '2007-2-1 00:00:00' & datetime <= '2007-2-2 23:59:59')

png("plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))


with(data, { 
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power" )
    plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

    
    lines(data$datetime, data$Sub_metering_2, col = "red")
    lines(data$datetime, data$Sub_metering_3, col = "blue")
    legend("topright", lwd = 2, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , bty = "n")
    
    plot(datetime, Voltage, type = "l")
    plot(datetime, Global_reactive_power, type = "l")
})


dev.off()
