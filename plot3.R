# Plot 3
library(data.table)
library(zoo)

# Read Data (Use data table to speed up)
dat <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset data for required dates
ndat <- subset(dat, dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02")

# Remove Data to free up memory
rm(dat)

# Create Minute Datapoints for plotting
dt <- paste(ndat$Date,ndat$Time)
dt <- strptime(dt, "%Y-%m-%d %H:%M:%S")

# Plot3
png("plot3.png")
plot(dt, ndat$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(dt, ndat$Sub_metering_1, col = "black")
lines(dt, ndat$Sub_metering_2, col = "red")
lines(dt, ndat$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()