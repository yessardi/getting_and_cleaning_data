## Download the zipped dataset from Url provided
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileUrl, destfile = "./HAR.zip",mode = "wb")

## Unzip the files into "UCI HAR Dataset"
unzip("HAR.zip",exdir = ".")

## Read below TRAIN files from "UCI HAR Dataset/train" under working directory
xtrainHAR = read.table("./UCI HAR Dataset/train/X_train.txt")
ytrainHAR = read.table("./UCI HAR Dataset/train/y_train.txt")
subtrainHAR = read.table("./UCI HAR Dataset/train/subject_train.txt")

## Combine the x,y and subject files above to form final TRAIN dataset
trainHAR = cbind(subtrainHAR,ytrainHAR,xtrainHAR)

## Read below TEST files from "UCI HAR Dataset/test" under working directory
xtestHAR = read.table("./UCI HAR Dataset/test/X_test.txt")
ytestHAR = read.table("./UCI HAR Dataset/test/y_test.txt")
subtestHAR = read.table("./UCI HAR Dataset/test/subject_test.txt")

## Combine the x,y and subject files above to form final TEST dataset
testHAR = cbind(subtestHAR,ytestHAR,xtestHAR)

## Read activity labels from "UCI HAR Dataset" under working directory
actHAR = read.table("./UCI HAR Dataset/activity_labels.txt")

## Provide descriptive variable names to acitivity dataset
names(activityHAR) = c("ActivityID","Activity")

## Read features list from "UCI HAR Dataset" under working directory
ftrHAR = read.table("./UCI HAR Dataset/features.txt")

## Tidy up Features list by removing punctuation and expanding variable names
ftrHAR[,2] = gsub("[[:punct:]]", "", ftrHAR[,2])
ftrHAR[,2] = gsub("mean", "Mean", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("std", "SD", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("Acc", "Acceleration.", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("Gyro", "Gyro.", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("Mag", "Magnitude.", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("gravity", "Gravity.", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("Jerk", "Jerk.", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("angle", "Angle.", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("BodyBody", "Body", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("tbody", "Time.Body.", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("tgravity.", "Time.Gravity.", ftrHAR[,2],ignore.case = TRUE)
ftrHAR[,2] = gsub("fbody", "Frequency.Body.", ftrHAR[,2],ignore.case = TRUE)

## Merge the TRAIN & TEST combined files above to form ALL dataset
allHAR = rbind(trainHAR,testHAR)

## Provide descriptive variable names from the cleaned up features list above
names(allHAR) = c("Subject","ActivityID",as.character(ftrHAR[,2]))

## Make sure the column names of ALL are in R compatible format
names(allHAR) = make.names(names(allHAR))

## Merge ALL dataset with activity dataset and fetch descriptive activity name
allHAR = merge(allHAR,activityHAR,by="ActivityID",all.x = TRUE)

## Choose only Mean and SD variables per subject/activity for final TIDY dataset
tidyHAR = allHAR[,grepl("subject|activity|mean|sd",names(allHAR),
                         ignore.case = TRUE)]

## Reformat the dataset to data table format 
library(data.table)
dtHAR = data.table(tidyHAR[,2:89])

## Aggregate means of all columns per Subject & Activity for TIDYAGG dataset
tidyaggHAR = dtHAR[,lapply(.SD,mean),by=list(Subject,Activity)][order(Subject)]

## Write the results to TIDYAGG text file for the report
write.table(tidyaggHAR, "tidyaggHAR.txt", row.names = FALSE)
