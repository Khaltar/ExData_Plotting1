electric = read.table("household_power_consumption.txt",
                      header=TRUE,
                      sep=";",
                      colClasses = c("character", "character", rep("numeric",7)),
                      na = "?")
subset = subset(electric, Date == "1/2/2007" | Date=="2/2/2007")
subset$Datetime = paste(subset$Date,subset$Time)
subset$Datetime = strptime(subset$Datetime, "%d/%m/%Y %H:%M:%S")
png(file="plot3.png",width = 480, height = 480, units = "px",bg="white")
plot(subset$Datetime, subset$Sub_metering_1, ylab= "Energy sub metering",xlab="",type="l")
points(subset$Datetime, subset$Sub_metering_2, col= "red",type="l")
points(subset$Datetime, subset$Sub_metering_3, col= "blue", type="l")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
dev.off()

