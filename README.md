# getting_and_cleaning_data
This repo contains the process, code and output of converting HAR experiment raw data to tidy data
# Business Problem
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Solution Approach
## Getting Raw Data

Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it to the
R working directory under the folder "UCI HAR Dataset"

## Understanding the Raw Data
- The original raw datasets provided have information gathered about the Human Activity Recognition(HAR) experiment done on 30 Subjects/persons
- Using embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity for each Subject was monitored across six activities - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- The available data was randomly partitioned into two sets, about 70% as a training set(dim - 7352 x 561) under /train subfolder and remaining 30% (dim - 2947 x 561) as test set along under /test subfolder
- Also  separate features list (dim - 2947 x 561) and activity labels list(dim - 6 x 2) were provided

## Processing the Raw Data
- A "run_analysis.R" script file was created in R to process the raw data provided and tidy them up as per specifications
- The training files named X_train, Y_train and subject_train were separately read into R workspace and then combined into "trainHAR" dataset(dim-7352 x 563) The corresponding test files were read and combined into "testHAR" dataset(dim-2947 x 563)
- The activity_labels text file was read into R as "actHAR" datset and the columns were named as "ActivityID" and "Activity"(dim - 6 x 2) 	
- The features text file was read into R as "ftrHAR"(dim - 561 x 2) and feature list was tidied up by expanding abbreviated names and also removing punctuations/wild characters
- The "trainHAR" and "testHAR" were merged to form "allHAR"(dim - 10299 x 563) and column names were updated with the tidied up feature list from above and verified for R compatibility. Also "allHAR" was merged with "activityHAR" to fetch descriptive activity names for the activity ids (dim - 10299 x 564)

## Creating the final tidy dataset and report
- From the final merged "allHAR" dataset only features with Mean and Standard Deviation(SD) measures for each subject & attribute was chosen for the final "tidyHAR" dataset(dim - 10299 x 88)
- "tidyHAR" dataset was reformatted as data table and aggregated column means of all Mean and SD features were aggregated for each subject and activity in "tidyaggHAR" 180 rows(30 subjects x 6 activity each)  and 88 aggregated means columns of final output were written to "tidyaggHAR.txt" for the report

## Repository Document Reference
- Codebook.md - Has details about all the features in the final tidy dataset
- run_analysis.R - Code for cleaning up the raw data and creating a tidy dataset
- tidyaggHAR.txt - Final tidy dataset output of 180 rows(30 subjects x 6 activity each)  and 88 aggregated means columns
