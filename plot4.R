electric = read.table("household_power_consumption.txt",
                      header=TRUE,
                      sep=";",
                      colClasses = c("character", "character", rep("numeric",7)),
                      na = "?")
subset = subset(electric, Date == "1/2/2007" | Date=="2/2/2007")
subset$Datetime = paste(subset$Date,subset$Time)
subset$Datetime = strptime(subset$Datetime, "%d/%m/%Y %H:%M:%S")
png(file="plot4.png",width = 480, height = 480, units = "px",bg="white")
par(mfrow=c(2,2))
plot(subset$Datetime, subset$Global_active_power, ylab= "Global Active Power (kilowatts)",xlab="",type="l")
plot(subset$Datetime, subset$Voltage, ylab= "Voltage",xlab="datetime",type="l")
plot(subset$Datetime, subset$Sub_metering_1, ylab= "Energy sub metering",xlab="",type="l")
points(subset$Datetime, subset$Sub_metering_2, col= "red",type="l")
points(subset$Datetime, subset$Sub_metering_3, col= "blue", type="l")
legend("topright", bty ="n",col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
plot(subset$Datetime, subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power",col="black")
dev.off()
