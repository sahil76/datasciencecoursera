---
title: "Getting and Cleaning Data in R"
output: html_document
---

## Codebook for the Assignment on Getting and Cleaning Data in R

### Train Datasets :

**1. inertial_train** : It lists all the txt files in the Inertial signals folder in the train data.

**2. inertial_train_list** : This is a list which reads all the concerning files in inertial_train.

**3. inertial_train_df** : It is a dataframe which binds all the read inertial_train files

**4. subject_train** : The subject_train data set

**5. x_train and y_train** : The dataframes of x and y in the train data.

### Test Datasets :

**1. inertial_test** : It lists all the txt files in the Inertial signals folder in the test data.

**2. inertial_test_list** : This is a list which reads all the concerning files in inertial_test.

**3. inertial_test_df** : It is a dataframe which binds all the read inertial_test files

**4. subject_test** : The subject_test data set

**5. x_test and y_test** : The dataframes of x and y in the test data.

### Bindind datasets:

**1. inertial_df** : Merging the datasets of the inertial dataframes of train and test.

**2. subject_df** : Merging the subjects dataframes of train and test.

**3. x_df and y_df** : Merging the data pertaining to x and y dataframes.

### Reading features related file and defining the activity labels

* **features** : File containing the features of the measures dataframe.

* **activity_labels** : The activity labels for the y dataframe which gives the final output. 
    + 1: Walking
    + 2: Walking Upstairs
    + 3: Walking Downstairs
    + 4: Sitting
    + 5: Standing
    + 6: Laying


### Choosing Mean and Standard Deviation measures

**1. selecting_mean_and_std ** : It is a vector which provides which columns in the x_df have the mean and standard deviation measures.

**2. mean_std_df ** : This is a dataframe which contains all the required columns as per the selecting_mean_std vector.

### Merged x and y dataframe :

**final_df** : This is a merged dataset for the x and y dataframe pertaining to merged train and test data.

### The Aggregated dataset for caculating mean for all the measures with respect to the activities

**cal_5** : Mean for all the measures with respect to the activities. 