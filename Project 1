library(data.table)

HPC <- fread("household_power_consumption.txt", na.strings="?")


HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

HPC[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

HPC <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

hist(HPC[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
