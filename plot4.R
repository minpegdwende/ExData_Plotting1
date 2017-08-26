#Plot 4

# First of all, download the file (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) and name it : household_power_consumption.txt

#Preparation of data
data <- read.csv2("./household_power_consumption.txt",colClasses="character")
febdata <- subset(data,dmy(Date)>=ymd("2007-02-01") & dmy(Date)<=ymd("2007-02-02"))
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power))



png(file = "plot4.png")

par("mfcol"=c(2,2))

#1st plot
plot(febdata$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="", type='l', xaxt = "n")
axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

#2nd plot

plot(febdata$Sub_metering_1,ylab="Energy sub metering",xlab="", type='l', xaxt = "n")
lines(febdata$Sub_metering_2,ylab="Energy sub metering",xlab="", type='l', xaxt = "n", col="red")
lines(febdata$Sub_metering_3,ylab="Energy sub metering",xlab="", type='l', xaxt = "n", col="blue")
legend("topright", col=c("black", "red", "blue"),cex = 0.2, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1, 1, 1), pch=c(NA,NA,NA))
axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

#3rd plot

plot(febdata$Voltage, ylab="Voltage",xlab="datatime", type='l', xaxt = "n")
axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

#4th plot

plot(febdata$Global_reactive_power,xlab="datatime", type='l', xaxt = "n")
axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

dev.off()