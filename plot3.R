
plot3 <- function() {
	## Load Data
	## Assumes the source data is in the the current directory
	powerData <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

	## Subset days we want
	powerData <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007",]

	## Convert the Time field from factor into proper date/time format (POSIXlt), using both Date and Time existing fields
	powerData <- transform(powerData, Time = strptime(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S"))

	## Open PDF device, width and height 480 px are default values
	png("plot3.png")

	## Build line graph for sub meter 1, then add extra data for sub meter 2 and 3
	plot(powerData$Time, powerData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
	lines(powerData$Time, powerData$Sub_metering_2, col="Red")
	lines(powerData$Time, powerData$Sub_metering_3, col="Blue")

	## Add legend, use lty to set legend symbol to lines
	legend("topright", lty=c(1,1), col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

	## Close device
	dev.off()
}
