
power <- read.csv( "household_power_consumption.txt", sep = ";", na.strings = c("?") )

# head(power)
#        Date     Time Global_active_power Global_reactive_power Voltage
# 1 16/12/2006 17:24:00               4.216                 0.418  234.84
#  Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
# 1             18.4              0              1             17

power$timestamp = as.POSIXct(paste0(power$Date, " ", power$Time), format="%d/%m/%Y %H:%M:%S")

power <- power[  power$timestamp >= as.POSIXct("2007-02-01") & power$timestamp < as.POSIXct("2007-02-03"), ] 

# 2 x 2, columns first

png(file = "plot4.png", width = 480, height = 480, units = "px") 

par(mfcol = c(2, 2))   # one row, two columns

# plot 1, same as stand alone plot 2

plot( power$timestamp, power$Global_active_power, ylab = "Global Active Power", xlab="", type="l" )

# plot 2, same as stand alone plot 2

plot( power$timestamp, power$Sub_metering_1, ylab = "Energy sub metering", xlab="", type="l" )  
lines( power$timestamp, power$Sub_metering_2, col="red" )
lines( power$timestamp, power$Sub_metering_3, col="blue" )

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, bty="n" )

# plot 3, voltage over datetime

plot( power$timestamp, power$Voltage, ylab = "Voltage", xlab="datetime", type="l" )

# plot 4

plot( power$timestamp, power$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l" )

# done

dev.off()



