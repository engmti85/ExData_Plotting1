dataFile <- "household_power_consumption.txt"
housePower <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
housePowerSubset <- housePower[housePower$Date %in% c("1/2/2007","2/2/2007") ,]

myDate <- as.Date(housePowerSubset$Date,"%d/%m/%Y")
myDateTime <- as.POSIXlt(x = paste(myDate," ",housePowerSubset$Time))

#######plot 2
png("plot2.png", width=480, height=480)
plot(myDateTime, as.numeric(housePowerSubset$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()