data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<- subset(data, data$Date == "2007-2-1" | data$Date == "2007-2-2")

png("plot1.png", width = 480, height = 480)

hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()

