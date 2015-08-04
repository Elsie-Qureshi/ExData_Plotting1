## plot4.R

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

## Show 4 plots side by side (2 in each row)

par(mfrow=c(2,2))

with(myData, plot (DateTime, 
      Global_active_power, 
      type = "l",
      ylab = "Global Active Power",
      xlab = ""))

with(myData, plot (DateTime, 
      Voltage, 
      type = "l"))
      
with(myData, plot (DateTime, 
      Sub_metering_1,
      type = "n",
      ylab = "Energy sub metering",
      xlab = ""))

with(myData, lines(DateTime, 
       Sub_metering_1, 
       col = "black"))

with(myData, lines(DateTime, 
       Sub_metering_2, 
       col = "red"))

     with(myData, lines(DateTime, 
       Sub_metering_3, 
       col = "blue"))

with(myData, plot (DateTime, 
      Global_reactive_power,
      type = "l"))
      
# Copy graph to PNG

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()