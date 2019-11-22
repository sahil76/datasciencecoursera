# Firstly loading all the required R packages

library(data.table)
library(dplyr)

# Setting the working directory for reading the specific files for the train datasets

setwd("E:/Coursera JHU R/datasciencecoursera/UCI HAR Dataset/train/Inertial Signals")

    # The following commands are used for loading all the files related to train data sets into R

inertial_train = list.files(pattern = "*.txt")
inertial_train_list = lapply(inertial_train,read.table)

inertial_train_df = bind_rows(inertial_train_list)

setwd("E:/Coursera JHU R/datasciencecoursera/UCI HAR Dataset/train")

subject_train = read.table("subject_train.txt")
x_train = read.table("X_train.txt")
y_train = read.table("y_train.txt")

rm("inertial_train_list")

# Setting the working directory for reading the specific files for the test datasets

setwd("E:/Coursera JHU R/datasciencecoursera/UCI HAR Dataset/test/Inertial Signals")

inertial_test = list.files(pattern = "*.txt")
inertial_test_list = lapply(inertial_test,read.table)

inertial_test_df = bind_rows(inertial_test_list)

setwd("E:/Coursera JHU R/datasciencecoursera/UCI HAR Dataset/test")

subject_test = read.table("subject_test.txt")
x_test = read.table("X_test.txt")
y_test = read.table("y_test.txt")

rm("inertial_test_list")

# The following commands are used for binding the respective dataframes so as to get a merged data

inertial_df = rbind(inertial_train_df,inertial_test_df)
subject_df = rbind(subject_train,subject_test)

x_df = rbind(x_train,x_test)
y_df = rbind(y_train,y_test)

# Again changing the working directory so that we can load the required features files

setwd("E:/Coursera JHU R/datasciencecoursera/UCI HAR Dataset")

features = read.table("features.txt")[2]    # The features file being loaded in R
str(features)

features$V2 = as.character(features$V2)     # Changing the class of features vector to a character vector so as to use this to change 
                                            # the colnames in the x dataframe    
colnames(x_df) = features$V2

class(y_df$V1)

activity_labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

y_df$V1 = factor(y_df$V1,labels = activity_labels)  # Changing the activity labels in the activities vector

names(y_df) = "Activities"

# The following code is used to selecting only the mean and standard deviations descriptives from the descriptives file

selecting_mean_and_std = grep("mean[()]|std()",colnames(x_df))
mean_std_df = x_df[,selecting_mean_and_std]

# Merging the whole data set of measures and the results

final_df = cbind(x_df,y_df)

# Following calculation provides the required tidy data set as per the 5th problem

cal_5 = aggregate(final_df[,1:561],list(final_df[,562]),mean)   # Here aggregate() function is used to get the mean of all the measures
                                                                # with respect to the activities
write.table(cal_5,"Tidy_data_set_5.txt",row.names = FALSE)      # Writing the dataset into a text file
