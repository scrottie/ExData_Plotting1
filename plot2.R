
power <- read.csv( "household_power_consumption.txt", sep = ";", na.strings = c("?") )

# head(power)
#        Date     Time Global_active_power Global_reactive_power Voltage
# 1 16/12/2006 17:24:00               4.216                 0.418  234.84
#  Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
# 1             18.4              0              1             17

# "We will only be using data from the dates 2007-02-01 and 2007-02-02."

# "Add the PNG file and R code file to your git repository"

# "Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels."
# this seems to be the default.

power$timestamp = as.POSIXct(paste0(power$Date, " ", power$Time), format="%d/%m/%Y %H:%M:%S")

power <- power[  power$timestamp >= as.POSIXct("2007-02-01") & power$timestamp < as.POSIXct("2007-02-03"), ] 

png(file = "plot2.png", width = 480, height = 480, units = "px") 

plot( power$timestamp, power$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="l" )  

dev.off()



