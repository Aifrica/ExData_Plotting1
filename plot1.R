
plot1 <- function() {

	## Load Data
	## Assumes the source data is in the the current directory
	powerData <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

	## Subset days we want
	powerData <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007",]

	## Open PDF device, width and height 480 px are default values
	png("plot1.png")

	## Build histogram, with custom color Red, and set X-axis label and title
	hist(powerData$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
}
