dataFile <- "household_power_consumption.txt"
housePower <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
housePowerSubset <- housePower[housePower$Date %in% c("1/2/2007","2/2/2007") ,]

myDate <- as.Date(housePowerSubset$Date,"%d/%m/%Y")
myDateTime <- as.POSIXlt(x = paste(myDate," ",housePowerSubset$Time))

#######plot 4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
###graph 1
plot(myDateTime, as.numeric(housePowerSubset$Global_active_power), type="l", xlab="", ylab="Global Active Power")

###graph 2
plot(myDateTime, as.numeric(housePowerSubset$Voltage), type="l", xlab="datetime", ylab="Voltage")

###graph 3
plot(myDateTime, as.numeric(housePowerSubset$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(myDateTime, as.numeric(housePowerSubset$Sub_metering_2), type="l", xlab="", col = "red")
lines(myDateTime, as.numeric(housePowerSubset$Sub_metering_3), type="l", xlab="", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

###graph 4
plot(myDateTime, as.numeric(housePowerSubset$Global_reactive_power), type="l", xlab="datetime" , ylab="Global_reactive_power")

###clode png device
dev.off()