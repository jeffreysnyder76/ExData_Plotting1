# Load required libraries
library(data.table)

# Read and preprocess data
file <- "household_power_consumption.txt"

# Read only data from 2007-02-01 and 2007-02-02
data <- fread(file, na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007")]

# Create a datetime column
data[, DateTime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

# plot1.R

library(data.table)

# Load and subset data
file <- "household_power_consumption.txt"
data <- fread(file, na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007")]

# Plot 1: Histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()