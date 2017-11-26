

#Loading the data set (subsetting 2007-02-01 and 2007-02-02.)
data <- read.table('household_power_consumption.txt', header= TRUE, sep=";")
new_data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

new_data$Global_active_power <- as.numeric(as.character(new_data$Global_active_power))
new_data$Date <- paste(new_data$Date,new_data$Time, sep= " ")
new_data$Date <- strptime((new_data$Date), "%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width = 480, height = 480) 
plot2<-plot(new_data$Date,new_data$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)")
dev.off()