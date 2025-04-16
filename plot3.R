# Load required libraries
library(data.table)

# Read and preprocess data
file <- "household_power_consumption.txt"

# Read only data from 2007-02-01 and 2007-02-02
data <- fread(file, na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007")]

# Create a datetime column
data[, DateTime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

# plot3.R

library(data.table)

# Load and subset data
file <- "household_power_consumption.txt"
data <- fread(file, na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007")]
data[, DateTime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

# Plot 3
png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()