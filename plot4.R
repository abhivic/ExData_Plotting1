
#plot4.R
power<- "./household_power_consumption.txt"

#reading household_power_consumption.txt

readpower<- read.table(power, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subsetting table as per require dates

subpower<- readpower[readpower$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subpower$Global_active_power)
globalReactivePower <- as.numeric(subpower$Global_reactive_power)
voltage <- as.numeric(subpower$Voltage)
subMetering1 <- as.numeric(subpower$Sub_metering_1)
subMetering2 <- as.numeric(subpower$Sub_metering_2)
subMetering3 <- as.numeric(subpower$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="time", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
