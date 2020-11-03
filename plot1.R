#Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset data to only include the 2 dates
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Open PNG plotting device
png("plot1.png", width = 480, height = 480)

#Plot histogram according to specifications
hist(as.numeric(data1$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

#Close PNG device
dev.off()