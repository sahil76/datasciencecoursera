---
title: "README"
output: html_document
---
## This file provides a description about how the run_analysis file works


* Firstly we will specify the path to the R environment and then download the necessary file to conduct the required analysis.

* Using the available data we will then specify the features and the activity labels we require.
 
* The train and test data is loaded into R using the read.table() command .

* The final data set is created by binding the train and test files.

* Now converting the class labels to activity names and factorising the subject variable.

* So that we can calculate the required summary of the datasets by melting the dataset into two variables Activity and Subjects.

* dcast() function is used to calculate the average of each variable for each activity and each subject .

* Finally we will write the tidy data set to a txt file.

