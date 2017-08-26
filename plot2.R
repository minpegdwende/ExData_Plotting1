#Plot 2

# First of all, download the file (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) and name it : household_power_consumption.txt

#Preparation of data
data <- read.csv2("./household_power_consumption.txt",colClasses="character")
febdata <- subset(data,dmy(Date)>=ymd("2007-02-01") & dmy(Date)<=ymd("2007-02-02"))
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power))


png(file = "plot2.png")
plot(febdata$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="", type='l', xaxt = "n")
axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))
dev.off()