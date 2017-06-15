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

## Create Plot 2
plot(data$Global_active_power ~ data$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()