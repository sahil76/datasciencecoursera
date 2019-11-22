---
title: "README"
output: html_document
---
## This file provides a description about how the run_analysis file works


* Firstly the working directory is changed to the location where the data for train files are stored

* Then we will load these files in R.
 
* The same steps are then repeated for the test files.

* After this we will all the required data frames as per the matching variables.

* The features table is loaded in R so that we can name the measures as provided in the x dataframe. And these features are then provided as names for the columns in x. But firstly we have to change the class of features so as to use them, the provided class is a factor variable, if we straight away change the names it will give an error so we have to change the names as character vector and then match the same to x.

* Now defining the activity labels as per the required results. And then matching these labels to the y dataframes factor levels.

* Measures related to the mean and standard deviations are selected in the selecting_mean_and_std df which are then matched to the x dataframe so that we can get a table containing only these measures.

* Finally we will use the aggregate() command to get the mean of all the measures with respect to the activity labels.

