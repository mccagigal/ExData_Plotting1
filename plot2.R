################################
# Plot 2 - Global Active Power #
################################

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
png(file="plot2.png", width = 480, height = 480, bg="transparent")
plot(target_days$Global_active_power , type="l" , main='', xlab='', ylab="Global Active Power (Kilowatts)" , xaxt="n")
axis( 1 , at = c(0,1440,2880) , labels=c("Thu","Fri","Sat") , las=0 )
dev.off()