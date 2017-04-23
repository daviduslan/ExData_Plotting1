## Set Working Directory
setwd("~/Documents/Data Science/Exploratory Data Analysis/week 1")

## Name File
file <- "household_power_consumption.txt"

## Load in source data then get the desired two-day subset
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Merge Date/Time into single field 'dateTime'
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Further subsets to break out all the columns into formats we'll use
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## Open png connection with desired dimensions / create a 2x2 grid to load in all 4 plots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## Re-create plot2
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## Create voltage plot
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Re-create plot3
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

## Create reactive power plot similar to plot2 then close connection
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()