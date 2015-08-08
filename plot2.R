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

##create plot #2
png("plot2.png" , height = 480, width = 480)
plot(hpc_sub$DateTime, hpc_sub$Global_active_power, pch=NA, xlab = "" ,
     ylab="Global Active Power (kilowatts)")
lines(hpc_sub$DateTime, hpc_sub$Global_active_power)
dev.off()