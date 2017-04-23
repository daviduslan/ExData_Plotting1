## Set Working Directory
setwd("~/Documents/Data Science/Exploratory Data Analysis/week 1")

## Name File
file <- "household_power_consumption.txt"

## Load in source data then get the desired two-day subset
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Merge Date/Time into single field 'dateTime'
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Further subset to get only the Global_active_power column
globalActivePower <- as.numeric(subSetData$Global_active_power)

## Split the three sub_metering columns into their own vectors
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## Open png device with proper dimensions, create initial plot
png("plot3.png", width=480, height=480)
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

## Add the two overlays 
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")

## Create legend / close device connection
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()