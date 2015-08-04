## plot3.R

## Load the data from file in working directory (requires 133 MB)

allData <- read.table(
    "household_power_consumption.txt", 
    header = TRUE, 
    sep = ";",
    na.strings = "?")

## Subset the data and remove previous object

myData <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007",]
remove(allData)

## Format the date and time columns into single datetime column

dateTimeVector <- paste(myData$Date,myData$Time)
myData$DateTime <- strptime(dateTimeVector,"%d/%m/%Y %H:%M:%S")

## Set up graph layout to single graph

par(mfrow=c(1,1))


## Plot energy sub metering by datetime using
## different lines and color for each sub metering type

plot (myData$DateTime, 
      myData$Sub_metering_1,
      type = "n",
      ylab = "Energy sub metering",
      xlab = "")

lines(myData$DateTime, 
       myData$Sub_metering_1, 
       col = "black")

lines(myData$DateTime, 
       myData$Sub_metering_2, 
       col = "red")

lines(myData$DateTime, 
       myData$Sub_metering_3, 
       col = "blue")

## Add a color legend to the top right corner of the graph

legend('topright', 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, 
       col=c('black', 'red', 'blue'),
       cex=.75)


## Copy graph to PNG

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()