# The necessary packages
library(data.table)
library(lubridate)
library(dplyr)

# Setting the working directory 
setwd("E:/Coursera JHU R/datasciencecoursera")

# Loading the data into R
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")

# Changing the date formats
data$DateTime = dmy_hms(paste(data$Date,data$Time))

# Filtering out the data for the particular days
calc_data = data%>%
  filter(dmy(Date) == ymd("2007-02-01") | dmy(Date) == ymd("2007-02-02"))

# Opening a png file to save the graph
png("plot4.png",width = 480,height = 480)

# Plotting the 4th graph
par(mfcol = c(2,2),oma = c(2,2,2,2),mar = c(3,3,0,0))

plot(calc_data$DateTime,as.numeric(calc_data$Global_active_power),type ="l",xlab = "",ylab = "Global Active Power")

plot(calc_data$DateTime,as.numeric(calc_data$Sub_metering_1),type = "l",xlab = "",ylab = "Energy sub metering")
lines(calc_data$DateTime,as.numeric(calc_data$Sub_metering_2),col = "red")
lines(calc_data$DateTime,as.numeric(calc_data$Sub_metering_3),col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"),bty = "n",cex = 0.5)

plot(calc_data$DateTime,as.numeric(calc_data$Voltage),type = "l",xlab = "datetime",ylab = "Voltage")

plot(calc_data$DateTime,as.numeric(calc_data$Global_reactive_power),type = "l",xlab = "datetime",ylab = "Global_reactive_power")


# Closing the graphics device
dev.off()