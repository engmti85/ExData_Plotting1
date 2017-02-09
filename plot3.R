dataFile <- "household_power_consumption.txt"
housePower <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
housePowerSubset <- housePower[housePower$Date %in% c("1/2/2007","2/2/2007") ,]

myDate <- as.Date(housePowerSubset$Date,"%d/%m/%Y")
myDateTime <- as.POSIXlt(x = paste(myDate," ",housePowerSubset$Time))

#######plot 3
png("plot3.png", width=480, height=480)
plot(myDateTime, as.numeric(housePowerSubset$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(myDateTime, as.numeric(housePowerSubset$Sub_metering_2), type="l", xlab="", col = "red")
lines(myDateTime, as.numeric(housePowerSubset$Sub_metering_3), type="l", xlab="", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()