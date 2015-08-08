##set working directory
setwd("~/Desktop/ExData_Plotting1")

##read data file
hpc<-read.csv("household_power_consumption.txt", sep=";", 
        colClasses = c('character', 'character', 'numeric', 'numeric', 
        'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
        na.strings='?')

##convert date and time variables
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

##subset dates
hpc_sub<-subset(hpc, as.Date(DateTime)>=as.Date("2007-02-01") & 
        as.Date(DateTime)<= ("2007-02-02"))

##create plot #4
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2))

plot(hpc_sub$DateTime, hpc_sub$Global_active_power, pch=NA,
     xlab="",
     ylab="Global Active Power")
lines(hpc_sub$DateTime, hpc_sub$Global_active_power)

plot(hpc_sub$DateTime, hpc_sub$Voltage,
     ylab="Voltage",
     xlab="datetime", pch=NA)
lines(hpc_sub$DateTime, hpc_sub$Voltage)

plot(hpc_sub$DateTime, hpc_sub$Sub_metering_1, pch=NA, xlab="", 
     ylab="Energy sub metering")
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_1, col = 'black')
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_2, col = 'red')
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_3, col = 'blue')
legend('topright',  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

plot(hpc_sub$DateTime, hpc_sub$Global_reactive_power, pch=NA,
     xlab="datetime",
     ylab="Global_reactive_power")
lines(hpc_sub$DateTime, hpc_sub$Global_reactive_power)
dev.off()

