library(data.table)
HPC <- fread("household_power_consumption.txt", na.strings="?")
HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


HPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)


plot(x = HPC[, dateTime]
     , y = HPC[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
