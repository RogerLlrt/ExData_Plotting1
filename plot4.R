require(sqldf)
setwd ("~/Exploratory data analysis/Data/")
Sys.setlocale("LC_TIME","English")

data <- read.csv.sql(file = 'household_power_consumption.txt', header = TRUE,  sep = ';', 
             sql = "select * from file where Date is '1/2/2007' or Date is '2/2/2007'", 
             eol = "\n")

datetime <- as.POSIXct(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time))

png('plot4.png',width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(datetime,y=data$Global_active_power,xlab='',
     ylab='Global Active Power (kilowatts)',type= 'l')

plot(datetime,y=data$Voltage,
     ylab='Voltage',type= 'l')

plot(datetime,y=data$Sub_metering_1,xlab='',
     ylab='Energy sub metering',type= 'n')
lines(datetime,y=data$Sub_metering_1,col='black')
lines(datetime,y=data$Sub_metering_2,col='red')
lines(datetime,y=data$Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'),lty=1,bty='n')

plot(datetime,y=data$Global_reactive_power,type= 'l',
     ylab='Global_reactive_power')

dev.off()