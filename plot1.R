## Load data
alldata = read.csv("household_power_consumption.txt", header = T, 
                    sep = ";", na.strings = "?")

## Convert strings to dates
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

## Subset by dates
data <- subset(alldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Create Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()