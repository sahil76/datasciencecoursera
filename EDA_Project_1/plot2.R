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
png("plot2.png",width = 480,height = 480)

# Plotting the 2nd graph

plot(calc_data$DateTime,as.numeric(calc_data$Global_active_power),type ="l",xlab = "",ylab = "Global Active Power (kilowatts)")

# Closing the graphics device
dev.off()
