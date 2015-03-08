# set working directory to directory containing household_power_consumption.txt
# before executing this script

data = read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"),
                colClasses=c("character", "character", "numeric",
                             "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric"))

data = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data$Timestamp = paste(data$Date, data$Time)
data$Timestamp = strptime(data$Timestamp, format="%d/%m/%Y %H:%M:%S")
png(filename="plot2.png", width=480, height=480)
plot(data$Timestamp, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()