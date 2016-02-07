# set the correct working directory 
oldDir <- getwd()
x <- "C:\\Users\\ZEZ227\\Desktop\\Training\\R\\Coursera\\Exploratory Data Analysis\\Week1\\Project1"
my_path <- gsub("\\\\", "/", x)
setwd(gsub("\\\\", "/", my_path))
rm(my_path, x)

fileName <- "household_power_consumption.txt" # set file name to read from
theData <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") # read the file
theDataSubset <- theData[theData$Date %in% c("1/2/2007","2/2/2007") ,] # subset to the date range we're interested in

datetime <- strptime(paste(theDataSubset$Date, theDataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(theDataSubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()