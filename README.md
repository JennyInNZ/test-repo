run_analysis
=========

This script does the following:
Reads the training and test data sets from ./UCI HAR Dataset/test/subject_test.txt and ./UCI HAR Dataset/test/subject_test.txt under the working directory

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement (those variables with names ending in std() or mean()

Renames the activities in the data set, according to the activity labels in ./UCI HAR Dataset/activity_labels.txt

Appropriately labels the data set with descriptive variable names, by removing any parentheses or dashes from the existing names.

Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Writes the tidy data set to ./data/tidy.csv
