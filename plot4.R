data <- read.table("~/Desktop/Coursera/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1) 
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
globalactive <- as.numeric(subSetData$Global_active_power)
Voltage <- as.numeric(subSetData$Voltage)
globalreactive <- as.numeric(subSetData$Global_reactive_power)

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

plot(datetime, globalactive, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, Sub_metering_2, type = "l", col = "red")
lines(datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, globalreactive, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
