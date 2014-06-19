run_analysis Codebook
========================================================

Introduction
-------------------------
The function run_analysis.R takes the data from the UCI HAR Dataset and processes it to produce a tidy data set containing the meaans for each mean and std variable. 

### Description of the study

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Sampling information
-------------------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Data Preparation
-------------------------
run_analysis.R works by reading in the files from test and training sets, loading in variable names and appropriately name This script does the following: 

1. Reads the training and test data sets from ./UCI HAR Dataset/test/subject_test.txt and ./UCI HAR Dataset/test/subject_test.txt under the working directory
2. Merges the training and the test sets to create one data set.
3. Renames the variables using the labels in ./UCI HAR Dataset/features.txt
4. Extracts only the measurements on the mean and standard deviation for each measurement (those variables with names ending in std() or mean())
5. Renames the activities in the data set, according to the activity labels in ./UCI HAR Dataset/activity_labels.txt
6. Appropriately labels the data set with descriptive variable names, by removing any parentheses or dashes from the existing names.
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
8. Writes the tidy data set to ./data/tidy.txt

Technical information about the files themselves
-------------------------
tidy.txt contains 180 observations of 68 variables for 30 subjects.


### Variables names in tidy.txt:
```{r}
Subject
Activity
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyAccMagMean
tGravityAccMagMean
tBodyAccJerkMagMean
tBodyGyroMagMean
tBodyGyroJerkMagMean
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyAccMagMean
fBodyBodyAccJerkMagMean
fBodyBodyGyroMagMean
fBodyBodyGyroJerkMagMean
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagStd
tGravityAccMagStd
tBodyAccJerkMagStd
tBodyGyroMagStd
tBodyGyroJerkMagStd
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyAccMagStd
fBodyBodyAccJerkMagStd
fBodyBodyGyroMagStd
fBodyBodyGyroJerkMagStd
```

