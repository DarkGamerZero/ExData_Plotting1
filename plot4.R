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
png("plot4.png", width = 480, height = 480)

#Create a plot with 4 sub-plots
par(mfrow = c(2,2))

#Plot the 4 sub-plots according to specifications
with(data1,{
  plot(data1$Time,as.numeric(data1$Global_active_power),type="l",  xlab="",ylab="Global Active Power")  
  plot(data1$Time,as.numeric(data1$Voltage), type="l",xlab="datetime",ylab="Voltage")
  plot(data1$Time,data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(data1,lines(Time,as.numeric(Sub_metering_1)))
   with(data1,lines(Time,as.numeric(Sub_metering_2),col="red"))
   with(data1,lines(Time,as.numeric(Sub_metering_3),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(data1$Time,as.numeric(data1$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#Close PNG device
dev.off()