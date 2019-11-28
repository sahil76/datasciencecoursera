# Loading the required datasets

library(data.table)
library(reshape2)

# Defining the path and downloading the data set to perform the analysis

path <- setwd("E:/Coursera JHU R/datasciencecoursera")

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url,file.path(path,"Data_UCI_Char.zip"))

# Load activity labels and features

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("classLabels","activityName"))

features <- read.table("UCI HAR Dataset/features.txt",col.names = c("index","featureNames"))

features_wanted <- grep("(mean|std)\\(\\)",features[,"featureNames"])

measurements <- features[features_wanted,"featureNames"]
measurements <- gsub("[()]","",measurements)

# Loading train datasets

train <- read.table("UCI HAR Dataset/train/X_train.txt")[,features_wanted]
data.table::setnames(train,colnames(train),measurements)
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt",col.names = c("Activity"))
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = c("SubjectNum"))

train <- cbind(trainSubjects,trainActivities,train)

# Loading test datasets

test <- read.table("UCI HAR Dataset/test/X_test.txt")[,features_wanted]
data.table::setnames(test,colnames(test),measurements)
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt",col.names = c("Activity"))
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = c("SubjectNum"))

test <- cbind(testSubjects,testActivities,test)

# Combining the datasets

final_data <- rbind(train,test)

# Converting the classLabels to activity names basicallly and factorising the subjectNum

final_data[["Activity"]] <- factor(final_data[,"Activity"],levels = activity_labels$classLabels,labels = activity_labels$activityName)

final_data$SubjectNum <- as.factor(final_data$SubjectNum)

final_data <- melt(final_data,id = c("SubjectNum","Activity"))

final_data <- dcast(final_data,SubjectNum + Activity ~ variable , fun.aggregate = mean)

# Writing the final tidy data set to a text file

write.table(final_data,"tidyData.txt")
