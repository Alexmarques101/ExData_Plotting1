#Loading the data set (subsetting 2007-02-01 and 2007-02-02.)
data <- read.table('household_power_consumption.txt', header= TRUE, sep=";")
new_data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

new_data$Global_active_power <- as.numeric(as.character(new_data$Global_active_power))
new_data$Date <- paste(new_data$Date,new_data$Time, sep= " ")
new_data$Date <- strptime((new_data$Date), "%Y-%m-%d %H:%M:%S")

new_data$Sub_metering_1 <- as.numeric(as.character(new_data$Sub_metering_1))
new_data$Sub_metering_2 <- as.numeric(as.character(new_data$Sub_metering_2))


png(filename="plot3.png", width = 480, height = 480,bg = "white") 
plot(new_data$Date,new_data$Sub_metering_1, type = "l", xlab= "", ylab = "Energy sub metering")
lines(new_data$Date,new_data$Sub_metering_2, col ="red")
lines(new_data$Date,new_data$Sub_metering_3, col ="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=1,col= c("black","red", "blue"))
dev.off()