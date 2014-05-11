
plot2 <- function() {
	## Load Data
	## Assumes the source data is in the the current directory
	powerData <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

	## Subset days we want
	powerData <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007",]

	## Convert the Time field from factor into proper date/time format (POSIXlt), using both Date and Time existing fields
	powerData <- transform(powerData, Time = strptime(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S"))

	## Open PDF device, width and height 480 px are default values
	png("plot2.png")

	## Build line graph, set Y-axis label and keep X-axis blank
	plot(powerData$Time, powerData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

	## Close device
	dev.off()
}
