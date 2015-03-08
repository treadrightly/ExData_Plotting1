# set working directory to directory containing household_power_consumption.txt
# before executing this script

data = read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"),
                colClasses=c("character", "character", "numeric",
                             "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric"))

data = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data$Timestamp = paste(data$Date, data$Time)
data$Timestamp = strptime(data$Timestamp, format="%d/%m/%Y %H:%M:%S")
png(filename="plot3.png", width=480, height=480)
plot(data$Timestamp, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, type="l", col="red")
lines(data$Timestamp, data$Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black', 'red', 'blue',' brown'))
dev.off()