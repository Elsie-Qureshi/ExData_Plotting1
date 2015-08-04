## plot2.R

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

## Plot line of global active power by date and time

plot (myData$DateTime, 
      myData$Global_active_power, 
      type = "l",
      ylab = "Global Active Power (kilowatts)",
      xlab = "")

# Copy graph to PNG

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()