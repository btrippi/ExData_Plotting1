## Load data
alldata = read.csv("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

## Convert strings to dates
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

## Subset by dates
data <- subset(alldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates and times
datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(datetime)

## Create Plot 3
with(data, {
  plot(Sub_metering_1 ~ datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ datetime,col='Red')
  lines(Sub_metering_3 ~ datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       cex = 0.75, y.intersp = 0.5,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()