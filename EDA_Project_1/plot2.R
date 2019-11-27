# The necessary packages
library(data.table)
library(lubridate)
library(dplyr)

# Setting the working directory 
setwd("E:/Coursera JHU R/datasciencecoursera")

# Loading the data into R
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")

# Changing the date formats
data$Date = dmy(data$Date)

# Filtering out the data for the particular days
calc_data = data%>%
  filter(Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

# Taking out the weekdays
calc_data$weekday = wday(calc_data$Date)

# Opening a png file to save the graph
png("plot2.png",width = 480,height = 480)

# Plotting the 2nd graph
par(mar = c(5,4,2,2))
plot(as.numeric(calc_data$Global_active_power),type ="l",axes = FALSE,frame.plot = TRUE,xlab = "",ylab = "Global Active Power (kilowatts)")
axis(1,at = seq(0,2900,length.out = 3),labels = c("Thu","Fri","Sat"))
axis(2,at = seq(0,6,2),lwd = 2)

# Closing the graphics device
dev.off()
