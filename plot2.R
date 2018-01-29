


#plot2.R
power<- "./household_power_consumption.txt"

#reading household_power_consumption.txt

readpower<- read.table(power, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subsetting table as per require dates

subpower<- readpower[readpower$Date %in% c("1/2/2007","2/2/2007"),]

time <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subpower$Global_active_power)

# PNG file with a width of 480 pixels and a height of 480 pixels

png("plot2.png", width=480, height=480)

# histogram command

plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()