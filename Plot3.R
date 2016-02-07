# set the correct working directory 
oldDir <- getwd()
x <- "C:\\Users\\ZEZ227\\Desktop\\Training\\R\\Coursera\\Exploratory Data Analysis\\Week1\\Project1"
my_path <- gsub("\\\\", "/", x)
setwd(gsub("\\\\", "/", my_path))
rm(my_path, x)

fileName <- "household_power_consumption.txt" # set file name to read from
theData <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") # read the file
theDataSubset <- theData[theData$Date %in% c("1/2/2007","2/2/2007") ,] # subset to the date range we're interested in
rm(fileName, theData)

datetime <- strptime(paste(theDataSubset$Date, theDataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(theDataSubset$Global_active_power)
subMetering1 <- as.numeric(theDataSubset$Sub_metering_1)
subMetering2 <- as.numeric(theDataSubset$Sub_metering_2)
subMetering3 <- as.numeric(theDataSubset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()