
power <- read.csv( "household_power_consumption.txt", sep = ";", na.strings = c("?") )

# head(power)
#        Date     Time Global_active_power Global_reactive_power Voltage
# 1 16/12/2006 17:24:00               4.216                 0.418  234.84
#  Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
# 1             18.4              0              1             17

# "We will only be using data from the dates 2007-02-01 and 2007-02-02."

power$Date = as.Date(power$Date, format="%d/%m/%Y")

power <- power[  power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"), ] 

# apparently have to plot the axes ourselves first because if we specify a range to the plot function, it'll cut off plotting
# rather than just cutting off the labels, and also to get it to skip the values/ticks skipped in the reference graph on both axes.

plot( hist(power$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", axes=FALSE)
axis(1, at=(0, 2, 4, 6))
axis(2, at=c(0, 200, 400, 600, 800, 1000, 1200))



