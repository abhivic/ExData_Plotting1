
#plot3.R
power<- "./household_power_consumption.txt"

#reading household_power_consumption.txt

readpower<- read.table(power, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subsetting table as per require dates

subpower<- readpower[readpower$Date %in% c("1/2/2007","2/2/2007"),]

time <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subpower$Global_active_power)
subMetering1 <- as.numeric(subpower$Sub_metering_1)
subMetering2 <- as.numeric(subpower$Sub_metering_2)
subMetering3 <- as.numeric(subpower$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(time, subMetering2, type="l", col="red")
lines(time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
