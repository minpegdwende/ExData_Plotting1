#Plot 1

# First of all, download the file (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) and name it : household_power_consumption.txt

#Preparation of data
data <- read.csv2("./household_power_consumption.txt",colClasses="character")
febdata <- subset(data,dmy(Date)>=ymd("2007-02-01") & dmy(Date)<=ymd("2007-02-02"))
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power))


png(file = "plot1.png")
with(febdata,hist(Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()

