data <- read.table("~/Desktop/Coursera/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalactive <- as.numeric(subSetData$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
hist(globalactive, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
