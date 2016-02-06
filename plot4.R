##########################
# Plot 4 - Multiple plot #
##########################

# Download file if it is not 
if (!file.exists( "exdata_data_household_power_consumption.zip" )){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata_data_household_power_consumption.zip", method="curl")
}
# Unzip file if the folder is not
if (!file.exists("household_power_consumption.txt")) { 
    unzip("exdata_data_household_power_consumption.zip") 
}
# Read the file as table
raw_data <- read.table("household_power_consumption.txt" , sep=";" , header=TRUE , na.strings="?")
# Filter the required data
date <- strptime( raw_data[,"Date"] , "%d/%m/%Y")
target_days <- raw_data[ date == strptime( "01/02/2007" , "%d/%m/%Y") | date == strptime( "02/02/2007" , "%d/%m/%Y") ,]

# Create the figure
png(file="plot4.png", width = 480, height = 480, bg="transparent")
par(mfrow = c(2,2))
# Plot 1
plot(target_days$Global_active_power , type="l" , main='', xlab='', ylab="Global Active Power" , xaxt="n")
axis( 1 , at = c(0,1440,2880) , labels=c("Thu","Fri","Sat") , las=0 )
# Plot 2
plot(target_days$Voltage , type="l" , main='', xlab='datetime', ylab="Voltage" , xaxt="n")
axis( 1 , at = c(0,1440,2880) , labels=c("Thu","Fri","Sat") , las=0 )
# Plot 3
plot( target_days$Sub_metering_1 , type="l"   , main='', xlab='', ylab="Energy sub metering" , xaxt="n")
lines ( target_days$Sub_metering_2 , col="red"  , type="l" )
lines ( target_days$Sub_metering_3 , col="blue" , type="l" )
axis( 1 , at = c(0,1440,2880) , labels=c("Thu","Fri","Sat") , las=0 )
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col=c("black","red","blue") , lty=c(1,1,1) , bty = "n")
#Plot 4
plot(target_days$Global_reactive_power , type="l" , main='', xlab='datetime', ylab="Global_reactive_power" , xaxt="n")
axis( 1 , at = c(0,1440,2880) , labels=c("Thu","Fri","Sat") , las=0 )
dev.off()