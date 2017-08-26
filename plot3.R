#Plot 3

# First of all, download the file (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) and name it : household_power_consumption.txt

#Preparation of data
data <- read.csv2("./household_power_consumption.txt",colClasses="character")
febdata <- subset(data,dmy(Date)>=ymd("2007-02-01") & dmy(Date)<=ymd("2007-02-02"))
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power))

png(file = "plot3.png")
plot(febdata$Sub_metering_1,ylab="Energy sub metering",xlab="", type='l', xaxt = "n")
lines(febdata$Sub_metering_2,ylab="Energy sub metering",xlab="", type='l', xaxt = "n", col="red")
lines(febdata$Sub_metering_3,ylab="Energy sub metering",xlab="", type='l', xaxt = "n", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1, 1, 1), pch=c(NA,NA,NA))
axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))
dev.off()
