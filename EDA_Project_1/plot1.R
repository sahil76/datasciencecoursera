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
png("plot1.png",width = 480,height = 480)

# Plot 1 
hist(as.numeric(calc_data$Global_active_power),col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")

# Closing the graphics device
dev.off()
