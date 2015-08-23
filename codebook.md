## Study Design

- The original raw datasets provided pertain to information gathered about the Human Activity Recognition(HAR) experiment done on 30 Subjects/persons
- Using embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity for each Subject was monitored across six activities - 
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- The captured data was made available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip in two randomly partitioned sets, 
about 70% as a training set(dim - 7352 x 561) and remaining 30% (dim - 2947 x 561) as test set along with a separate features list 
- The above dataset was unzipped into a directory called UCI HAR DATASET under the R working directory. A "run_analysis.R" script file was created in R to process
the raw data provided and tidy them up as per project specifications
- The training files named X_train, Y_train and subject_train were separately read into R workspace and then combined into "trainHAR" dataset(dim - 7352 x 563)
The corresponding test files were read and combined into "testHAR" dataset(dim - 2947 x 563)
- The activity_labels text file was read into R as "actHAR" datset and the columns were named as "ActivityID" and "Activity"(dim - 6 x 2) 	
- The features text file was read into R as "ftrHAR"(dim - 561 x 2) and feature list was tidied up by expanding abbreviated names and also removing punctuations/wild characters
- The "trainHAR" and "testHAR" were merged to form "allHAR"(dim - 10299 x 563) and column names were updated with the tidied up feature list from above and verified for R compatibility
Also "allHAR" was merged with "activityHAR" to fetch descriptive activity names for the activity ids (dim - 10299 x 564)
- From the final merged "allHAR" dataset only features with Mean and Standard Deviation(SD) measures for each subject/attribute was chosen for the final "tidyHAR" dataset(dim - 10299 x 88)
- "tidyHAR" dataset was reformatted as data table and aggregated column means of all Mean and SD features were aggregated for each subject and activity in 
"tidyaggHAR" 180 rows(30 subjects x 6 activity each)  and 88 aggregated means columns of final output were written to ""tidyaggHAR.txt" for the report

## Code Book

### Below is a brief overview about the 88 final attributes in the final tidy data file "tidyaggHAR.txt" 

- Attribute 1 Subject denote the persons(1-30) who undertook different activities
- Attribute 2 Activity denote the different activities the subjects undertook namely WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- Attributes 3-88 in the dataset are the Mean and Standard Deviation measures of linear acceleration(measured by accelerometer) and radial acceleration(measured by gyroscope)
- XYZ is used to denote 3-axial signals in the X, Y and Z directions
- Time domain signals all start with "time" prefix
- Frequency domain signal variables all start with "frequency" prefix
- Jerk signals from body linear acceleration and angular velocity derived in time are denoted by "jerk"
- Mag from raw data has been expanded as "magnitude" and "acc" as "acceleration"
- Mean and Standard Deviation variables have been aggregated subject-wise and activity-wise 

### Below are the 88 features included in the final tidy data file "tidyaggHAR.txt" 
	- (1)	subject
	- (2)	activity
	- (3)	timebodyaccelerationmeanx
	- (4)	timebodyaccelerationmeany
	- (5)	timebodyaccelerationmeanz
	- (6)	timebodyaccelerationstandarddeviationx
	- (7)	timebodyaccelerationstandarddeviationy
	- (8)	timebodyaccelerationstandarddeviationz
	- (9)	timegravityaccelerationmeanx
	- (10)	timegravityaccelerationmeany
	- (11)	timegravityaccelerationmeanz
	- (12)	timegravityaccelerationstandarddeviationx
	- (13)	timegravityaccelerationstandarddeviationy
	- (14)	timegravityaccelerationstandarddeviationz
	- (15)	timebodyaccelerationjerkmeanx
	- (16)	timebodyaccelerationjerkmeany
	- (17)	timebodyaccelerationjerkmeanz
	- (18)	timebodyaccelerationjerkstandarddeviationx
	- (19)	timebodyaccelerationjerkstandarddeviationy
	- (20)	timebodyaccelerationjerkstandarddeviationz
	- (21)	timebodygyroscopemeanx
	- (22)	timebodygyroscopemeany
	- (23)	timebodygyroscopemeanz
	- (24)	timebodygyroscopestandarddeviationx
	- (25)	timebodygyroscopestandarddeviationy
	- (26)	timebodygyroscopestandarddeviationz
	- (27)	timebodygyroscopejerkmeanx
	- (28)	timebodygyroscopejerkmeany
	- (29)	timebodygyroscopejerkmeanz
	- (30)	timebodygyroscopejerkstandarddeviationx
	- (31)	timebodygyroscopejerkstandarddeviationy
	- (32)	timebodygyroscopejerkstandarddeviationz
	- (33)	timebodyaccelerationmagnitudemean
	- (34)	timebodyaccelerationmagnitudestandarddeviation
	- (35)	timegravityaccelerationmagnitudemean
	- (36)	timegravityaccelerationmagnitudestandarddeviation
	- (37)	timebodyaccelerationjerkmagnitudemean
	- (38)	timebodyaccelerationjerkmagnitudestandarddeviation
	- (39)	timebodygyroscopemagnitudemean
	- (40)	timebodygyroscopemagnitudestandarddeviation
	- (41)	timebodygyroscopejerkmagnitudemean
	- (42)	timebodygyroscopejerkmagnitudestandarddeviation
	- (43)	frequencybodyaccelerationmeanx
	- (44)	frequencybodyaccelerationmeany
	- (45)	frequencybodyaccelerationmeanz
	- (46)	frequencybodyaccelerationstandarddeviationx
	- (47)	frequencybodyaccelerationstandarddeviationy
	- (48)	frequencybodyaccelerationstandarddeviationz
	- (49)	frequencybodyaccelerationmeanfrequencyx
	- (50)	frequencybodyaccelerationmeanfrequencyy
	- (51)	frequencybodyaccelerationmeanfrequencyz
	- (52)	frequencybodyaccelerationjerkmeanx
	- (53)	frequencybodyaccelerationjerkmeany
	- (54)	frequencybodyaccelerationjerkmeanz
	- (55)	frequencybodyaccelerationjerkstandarddeviationx
	- (56)	frequencybodyaccelerationjerkstandarddeviationy
	- (57)	frequencybodyaccelerationjerkstandarddeviationz
	- (58)	frequencybodyaccelerationjerkmeanfrequencyx
	- (59)	frequencybodyaccelerationjerkmeanfrequencyy
	- (60)	frequencybodyaccelerationjerkmeanfrequencyz
	- (61)	frequencybodygyroscopemeanx
	- (62)	frequencybodygyroscopemeany
	- (63)	frequencybodygyroscopemeanz
	- (64)	frequencybodygyroscopestandarddeviationx
	- (65)	frequencybodygyroscopestandarddeviationy
	- (66)	frequencybodygyroscopestandarddeviationz
	- (67)	frequencybodygyroscopemeanfrequencyx
	- (68)	frequencybodygyroscopemeanfrequencyy
	- (69)	frequencybodygyroscopemeanfrequencyz
	- (70)	frequencybodyaccelerationmagnitudemean
	- (71)	frequencybodyaccelerationmagnitudestandarddeviation
	- (72)	frequencybodyaccelerationmagnitudemeanfrequency
	- (73)	frequencybodyaccelerationjerkmagnitudemean
	- (74)	frequencybodyaccelerationjerkmagnitudestandarddeviation
	- (75)	frequencybodyaccelerationjerkmagnitudemeanfrequency
	- (76)	frequencybodygyroscopemagnitudemean
	- (77)	frequencybodygyroscopemagnitudestandarddeviation
	- (78)	frequencybodygyroscopemagnitudemeanfrequency
	- (79)	frequencybodygyroscopejerkmagnitudemean
	- (80)	frequencybodygyroscopejerkmagnitudestandarddeviation
	- (81)	frequencybodygyroscopejerkmagnitudemeanfrequency
	- (82)	angletimebodyaccelerationmeangravity
	- (83)	angletimebodyaccelerationjerkmeangravitymean
	- (84)	angletimebodygyroscopemeangravitymean
	- (85)	angletimebodygyroscopejerkmeangravitymean
	- (86)	anglexgravitymean
	- (87)	angleygravitymean
	- (88)	anglezgravitymean
