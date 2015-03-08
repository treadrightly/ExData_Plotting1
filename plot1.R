# set working directory to directory containing household_power_consumption.txt
# before executing this script

data = read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"),
                colClasses=c("character", "character", "numeric",
                             "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric"))

data = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data$Timestamp = paste(data$Date, data$Time)
data$Timestamp = strptime(data$Timestamp, format="%d/%m/%Y %H:%M:%S")
png(filename="plot1.png", width=480, height=480)
hist(x=data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
