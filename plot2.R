electric = read.table("household_power_consumption.txt",
                      header=TRUE,
                      sep=";",
                      colClasses = c("character", "character", rep("numeric",7)),
                      na = "?")
subset = subset(electric, Date == "1/2/2007" | Date=="2/2/2007")
subset$Datetime = paste(subset$Date,subset$Time)
subset$Datetime = strptime(subset$Datetime, "%d/%m/%Y %H:%M:%S")
png(file="plot2.png",width = 480, height = 480, units = "px",bg="white")
plot(subset$Datetime, subset$Global_active_power, ylab= "Global Active Power (kilowatts)",xlab="",type="l")
dev.off()
