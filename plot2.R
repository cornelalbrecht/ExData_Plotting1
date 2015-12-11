# Plot 2
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

#Plot2
png("plot2.png")
plot(dt, ndat$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(dt, ndat$Global_active_power)
dev.off()