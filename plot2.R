require(sqldf)
setwd ("~/Exploratory data analysis/Data/")

data <- read.csv.sql(file = 'household_power_consumption.txt', header = TRUE,  sep = ';', 
             sql = "select * from file where Date is '1/2/2007' or Date is '2/2/2007'", 
             eol = "\n")

datetime <- as.POSIXct(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time))

png('plot2.png',width = 480, height = 480, units = "px")
plot(datetime,y=data$Global_active_power,xlab='',
     ylab='Global Active Power (kilowatts)',type= 'l')

dev.off()