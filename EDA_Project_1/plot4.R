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

# Opening a png file to save the graph
png("plot4.png",width = 480,height = 480)

# Plotting the 4th graph
par(mfcol = c(2,2),oma = c(1,1,0,0),mar = c(2,2,0,0))

par(mar = c(6,6,4,4))
plot(as.numeric(final_data$Global_active_power),type ="l",axes = FALSE,frame.plot = TRUE,xlab = "",ylab = "Global Active Power")
axis(1,at = seq(0,2900,length.out = 3),labels = c("Thu","Fri","Sat"))
axis(2,at = seq(0,6,2),lwd = 2)

plot(as.numeric(final_data$Sub_metering_1),type = "l",axes = FALSE,frame.plot = TRUE,xlab = "",ylab = "Energy sub metering")
lines(as.numeric(final_data$Sub_metering_2),col = "red")
lines(as.numeric(final_data$Sub_metering_3),col = "blue")
axis(1,at = seq(0,2900,length.out = 3),labels = c("Thu","Fri","Sat"))
axis(2,at = seq(0,30,10),tick = TRUE,lty = "solid",lwd = 2)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"),bty = "n",cex = 0.5)

plot(as.numeric(final_data$Voltage),type = "l",axes = FALSE,frame.plot = TRUE,xlab = "datetime",ylab = "Voltage")
axis(1,at = seq(0,2900,length.out = 3),labels = c("Thu","Fri","Sat"))
axis(2,at = seq(234,246,4),lwd = 2)

plot(as.numeric(final_data$Global_reactive_power),type = "l",axes = FALSE,frame.plot = TRUE,xlab = "datetime",ylab = "Global_reactive_power")
axis(1,at = seq(0,2900,length.out = 3),labels = c("Thu","Fri","Sat"))
axis(2,at = seq(0,0.5,.1),lwd = 2)


# Closing the graphics device
dev.off()