##########################################
# Plot 1 - Global Active Power Histogram #
##########################################

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
png(file="plot1.png", width = 480, height = 480, bg="transparent")
hist(target_days$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()