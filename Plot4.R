library(data.table)

HPC <- fread("household_power_consumption.txt", na.strings="?")

HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

HPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(HPC[, dateTime], HPC[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

plot(HPC[, dateTime],HPC[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(HPC[, dateTime], HPC[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(HPC[, dateTime], HPC[, Sub_metering_2], col="red")
lines(HPC[, dateTime], HPC[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

plot(HPC[, dateTime], HPC[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
