---
title: "Getting and Cleaning Data in R"
output: html_document
---

## Codebook for the Assignment on Getting and Cleaning Data in R

### Reading features related file and defining the activity labels

* **activity_labels** : File containing the activity lables with class Labels.

* **features ** : File with all the 561 features with their respective index.

* **features_wanted ** : All the required features with either mean or standard deviation

### Train Datasets :

**1. train** : The initial train dataset.

**2. trainActivities** : The train activities dataset.

**3. trainSubject** : The train subjects dataset.

### test Datasets :

**1. test** : The initial test dataset.

**2. testActivities** : The test activities dataset.

**3. testSubject** : The test subjects dataset.

### Final datasets:

* **final_data** : It is the binded dataset of the train and test datasets.

### Calculations for the average of each variable for each activity and each subject :

* For the required calculation we converted the class labels as (1,2,3,4,5,6) to their respective activity labels ("Walking","Walking upstairs",etc) and then we used the melt() function to reduce the data by two variables namely the Subject variable and the Activity variable, and finally we used the dcast() function to calculate mean for the same.