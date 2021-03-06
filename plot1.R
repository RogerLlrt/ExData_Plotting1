require(sqldf)
setwd ("~/Exploratory data analysis/Data/")

data <- read.csv.sql(file = 'household_power_consumption.txt', header = TRUE,  sep = ';', 
             sql = "select * from file where Date is '1/2/2007' or Date is '2/2/2007'", 
             eol = "\n")

png('plot1.png',width = 480, height = 480, units = "px")
hist(data$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',
     main = 'Global Active Power')

dev.off()