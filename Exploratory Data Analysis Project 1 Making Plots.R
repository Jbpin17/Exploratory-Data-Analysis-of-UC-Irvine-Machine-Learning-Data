library(data.table)
#PLOT ONE CODE
#Reading in the data
powerdata <- data.table::fread(input = "household_power_consumption.txt",
                               na.strings = "?")
#Setting Histogram to Numeric Notation
powerdata[,Global_active_power := lapply(.SD, as.numeric), .SDcols=c("Global_active_power")]

#Cleaning the Date Column
powerdata[,Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filtering Dates Based on Instructions
powerdata <- powerdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Creating the Plot
png("plotone.png", width=500, height=500)

hist(powerdata[,Global_active_power], main="Global Active Power",
     xlab = "Global Active Power (kw)", ylab="Frequency", col="Red")
dev.off()

#PLOT 2 CODE
#Reading in the data
powerdata <- data.table::fread(input = "household_power_consumption.txt",
                               na.strings = "?")
#Setting Histogram to Numeric Notation
powerdata[,Global_active_power := lapply(.SD, as.numeric), .SDcols=c("Global_active_power")]

#Creating the DateTime Column
powerdata[,dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Filtering Dates Based on Instructions
powerdata <- powerdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Creating the Plot
png("plottwo.png", width=500, height=500)

plot(x = powerdata[,dateTime],
     y = powerdata[, Global_active_power], type = "l",
    xlab = "", ylab = "Global Active Power(kw)")
dev.off()


#PLOT 3 CODE
#Reading in the data
powerdata <- data.table::fread(input = "household_power_consumption.txt",
                               na.strings = "?")
#Setting Histogram to Numeric Notation
powerdata[,Global_active_power := lapply(.SD, as.numeric), .SDcols=c("Global_active_power")]

#Creating the DateTime Column
powerdata[,dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Filtering Dates Based on Instructions
powerdata <- powerdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Creating the Plot
png("plotthree.png", width=500, height=500)

plot(powerdata[,dateTime],
     powerdata[, Sub_metering_1], type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(powerdata[,dateTime], powerdata[, Sub_metering_2], col="red")
lines(powerdata[,dateTime], powerdata[, Sub_metering_3], col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),
       lty=c(1,1), lwd=c(1,1))
dev.off()


#PLOT 4 CODE
#Reading in the data
powerdata <- data.table::fread(input = "household_power_consumption.txt",
                               na.strings = "?")
#Setting Histogram to Numeric Notation
powerdata[,Global_active_power := lapply(.SD, as.numeric), .SDcols=c("Global_active_power")]

#Creating the DateTime Column
powerdata[,dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Filtering Dates Based on Instructions
powerdata <- powerdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Creating the plots

#Plot 1
png("plot4.png", width=500, height=500)

par(mfrow=c(2,2))
plot(x = powerdata[,dateTime],
     y = powerdata[, Global_active_power], type="l",
     xlab = "", ylab = "Global Active Power(kw)")

#Plot 2
plot(x = powerdata[,dateTime],
     y = powerdata[, Voltage], type="l",
     xlab = "DateTime", ylab = "Voltage")

#Plot 3
plot(powerdata[,dateTime],
     powerdata[, Sub_metering_1], type="l",
     xlab = "", ylab = "Energy sub metering")
lines(powerdata[,dateTime], powerdata[, Sub_metering_2], col="red")
lines(powerdata[,dateTime], powerdata[, Sub_metering_3], col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),
       lty=c(1,1), bty="n", cex = .5)

#Plot 4
plot(powerdata[,dateTime], powerdata[,Global_reactive_power], type="l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()