## Set Working Directory
setwd("~/Documents/Data Science/Exploratory Data Analysis/week 1")

## Name File
file <- "household_power_consumption.txt"

## Load in source data then get the desired two-day subset
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Only get Global_active_power column as needed for the plot from our subset
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Open png device at correct size
png("plot1.png", width=480, height=480)

# Create a histogram with our single column of data then close device connection
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
