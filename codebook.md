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

Below are the 88 features included in the final tidy data file "tidyaggHAR.txt" and a brief overview about them

- Attribute 1 Subject denote the persons(1-30) who undertook different activities
- Attribute 2 Activity denote the different activities the subjects undertook namely WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- Attributes 3-88 in this dataset are the Mean and Standard Deviation measures of linear acceleration(measured by accelerometer) and radial acceleration(measured by gyroscope). 
	- XYZ is used to denote 3-axial signals in the X, Y and Z directions.
	- Time domain signals all start with "Time." prefix
	- Frequency domain signal variables all start with "Frequency." prefix
	- Jerk signals from body linear acceleration and angular velocity derived in time are denoted by "Jerk."
	- Mag from raw data has been expanded as "Magnitude." and "Acc" as "Acceleration."
	- Mean and SD variables have been aggregated subject-wise and activity-wise 


- (1) Subject
- (2) Activity
- (3) Time.Body.Acceleration.MeanX
- (4) Time.Body.Acceleration.MeanY
- (5) Time.Body.Acceleration.MeanZ
- (6) Time.Body.Acceleration.SDX
- (7) Time.Body.Acceleration.SDY
- (8) Time.Body.Acceleration.SDZ
- (9) Time.Gravity.Acceleration.MeanX
- (10) Time.Gravity.Acceleration.MeanY
- (11) Time.Gravity.Acceleration.MeanZ
- (12) Time.Gravity.Acceleration.SDX
- (13) Time.Gravity.Acceleration.SDY
- (14) Time.Gravity.Acceleration.SDZ
- (15) Time.Body.Acceleration.Jerk.MeanX
- (16) Time.Body.Acceleration.Jerk.MeanY
- (17) Time.Body.Acceleration.Jerk.MeanZ
- (18) Time.Body.Acceleration.Jerk.SDX
- (19) Time.Body.Acceleration.Jerk.SDY
- (20) Time.Body.Acceleration.Jerk.SDZ
- (21) Time.Body.Gyro.MeanX
- (22) Time.Body.Gyro.MeanY
- (23) Time.Body.Gyro.MeanZ
- (24) Time.Body.Gyro.SDX
- (25) Time.Body.Gyro.SDY
- (26) Time.Body.Gyro.SDZ
- (27) Time.Body.Gyro.Jerk.MeanX
- (28) Time.Body.Gyro.Jerk.MeanY
- (29) Time.Body.Gyro.Jerk.MeanZ
- (30) Time.Body.Gyro.Jerk.SDX
- (31) Time.Body.Gyro.Jerk.SDY
- (32) Time.Body.Gyro.Jerk.SDZ
- (33) Time.Body.Acceleration.Magnitude.Mean
- (34) Time.Body.Acceleration.Magnitude.SD
- (35) Time.Gravity.Acceleration.Magnitude.Mean
- (36) Time.Gravity.Acceleration.Magnitude.SD
- (37) Time.Body.Acceleration.Jerk.Magnitude.Mean
- (38) Time.Body.Acceleration.Jerk.Magnitude.SD
- (39) Time.Body.Gyro.Magnitude.Mean
- (40) Time.Body.Gyro.Magnitude.SD
- (41) Time.Body.Gyro.Jerk.Magnitude.Mean
- (42) Time.Body.Gyro.Jerk.Magnitude.SD
- (43) Frequency.Body.Acceleration.MeanX
- (44) Frequency.Body.Acceleration.MeanY
- (45) Frequency.Body.Acceleration.MeanZ
- (46) Frequency.Body.Acceleration.SDX
- (47) Frequency.Body.Acceleration.SDY
- (48) Frequency.Body.Acceleration.SDZ
- (49) Frequency.Body.Acceleration.MeanFreqX
- (50) Frequency.Body.Acceleration.MeanFreqY
- (51) Frequency.Body.Acceleration.MeanFreqZ
- (52) Frequency.Body.Acceleration.Jerk.MeanX
- (53) Frequency.Body.Acceleration.Jerk.MeanY
- (54) Frequency.Body.Acceleration.Jerk.MeanZ
- (55) Frequency.Body.Acceleration.Jerk.SDX
- (56) Frequency.Body.Acceleration.Jerk.SDY
- (57) Frequency.Body.Acceleration.Jerk.SDZ
- (58) Frequency.Body.Acceleration.Jerk.MeanFreqX
- (59) Frequency.Body.Acceleration.Jerk.MeanFreqY
- (60) Frequency.Body.Acceleration.Jerk.MeanFreqZ
- (61) Frequency.Body.Gyro.MeanX
- (62) Frequency.Body.Gyro.MeanY
- (63) Frequency.Body.Gyro.MeanZ
- (64) Frequency.Body.Gyro.SDX
- (65) Frequency.Body.Gyro.SDY
- (66) Frequency.Body.Gyro.SDZ
- (67) Frequency.Body.Gyro.MeanFreqX
- (68) Frequency.Body.Gyro.MeanFreqY
- (69) Frequency.Body.Gyro.MeanFreqZ
- (70) Frequency.Body.Acceleration.Magnitude.Mean
- (71) Frequency.Body.Acceleration.Magnitude.SD
- (72) Frequency.Body.Acceleration.Magnitude.MeanFreq
- (73) Frequency.Body.Acceleration.Jerk.Magnitude.Mean
- (74) Frequency.Body.Acceleration.Jerk.Magnitude.SD
- (75) Frequency.Body.Acceleration.Jerk.Magnitude.MeanFreq
- (76) Frequency.Body.Gyro.Magnitude.Mean
- (77) Frequency.Body.Gyro.Magnitude.SD
- (78) Frequency.Body.Gyro.Magnitude.MeanFreq
- (79) Frequency.Body.Gyro.Jerk.Magnitude.Mean
- (80) Frequency.Body.Gyro.Jerk.Magnitude.SD
- (81) Frequency.Body.Gyro.Jerk.Magnitude.MeanFreq
- (82) Angle.Time.Body.Acceleration.MeanGravity.
- (83) Angle.Time.Body.Acceleration.Jerk.MeanGravity.Mean
- (84) Angle.Time.Body.Gyro.MeanGravity.Mean
- (85) Angle.Time.Body.Gyro.Jerk.MeanGravity.Mean
- (86) Ange.XGravity.Mean
- (87) Angle.YGravity.Mean
- (88) Angle.ZGravity.Mean
