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

## Open png device with proper dimensions
png("plot2.png", width=480, height=480)

## Plot globalActivePower over our new dateTime field data
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()