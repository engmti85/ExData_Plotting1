dataFile <- "household_power_consumption.txt"
housePower <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
housePowerSubset <- housePower[housePower$Date %in% c("1/2/2007","2/2/2007") ,]

#######plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(housePowerSubset$Global_active_power) , col = "red" , main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()