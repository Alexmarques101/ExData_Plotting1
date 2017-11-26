#Exploratory Analysis Week 1 Project


#Loading the data set (subsetting 2007-02-01 and 2007-02-02.)
data <- read.table('household_power_consumption.txt', header= TRUE, sep=";")
class (data$Date) #as factor
#convert date from factor to date format
data$Date<- as.Date(data$Date, format = "%d/%m/%Y")

#subsetting data frame
new_data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Plot 1
#convert to numeric so that we can do an histogram
new_data$Global_active_power <- as.numeric(as.character(new_data$Global_active_power))

png(filename="plot1.png", width = 480, height = 480, bg = "white") 
plot1<-hist(new_data$Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") # 'x' must be numeric
dev.off()