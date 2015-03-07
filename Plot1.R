
d<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data<-d

data$datetime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S") 

data <- subset(data, datetime >= '2007-2-1 00:00:00' & datetime <= '2007-2-2 23:59:59')

png("plot1.png", width = 480, height = 480)

hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()

