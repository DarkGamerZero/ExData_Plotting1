#Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset data to only include the 2 dates
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#convert date and time formats using as.Date() and strptime()
data1$Date <- as.Date(data1$Date, format = "%d-%m-%Y")
data1$Time <- strptime(data1$Time, format = "%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Open PNG plotting device
png("plot2.png", width = 480, height = 480)

#Plot according to specifications
plot(data1$Time, as.numeric(data1$Global_active_power), type = "l", main = "Global Active Power vs Time", xlab = "", ylab = "Global Active Power(kilowatts)")

#Close PNG device
dev.off()