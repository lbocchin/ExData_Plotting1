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


##create plot #3
png("plot3.png", height=480, width=480)

plot(hpc_sub$DateTime, hpc_sub$Sub_metering_1, pch=NA, xlab="", 
     ylab="Energy sub metering")
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_1, col = 'black')
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_2, col = 'red')
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_3, col = 'blue')
legend('topright',  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))
dev.off()

