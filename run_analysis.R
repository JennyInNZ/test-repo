
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each 
# activity and each subject. 
run_analysis  <- function() {
  #--------------------------------------------------------------------
  # Get the test sets
  #--------------------------------------------------------------------
  testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                             comment.char = "")
  testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", comment.char = "")
  #   Figure out the classes in the big data set to speed up reading the table
  initial <- read.table("./UCI HAR Dataset/test/X_test.txt", nrows=100)
  classes <- sapply(initial, class)
  testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                        comment.char = "", colClasses=classes)
  #--------------------------------------------------------------------
  # Get the training sets
  #--------------------------------------------------------------------
  trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                              comment.char = "")
  trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", comment.char = "")
  trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                         comment.char = "", colClasses=classes)
  
  #--------------------------------------------------------------------
  # Merge the sets into one
  #--------------------------------------------------------------------
  # Merge the test sets
  testMerged <- cbind(testSubjects, testLabels, testSet)
  
  # Merge the train sets
  trainMerged <- cbind(trainSubjects, trainLabels, trainSet)

  #   Combine the test and train data sets into one
  allMerged <- rbind(testMerged, trainMerged)

  #--------------------------------------------------------------------
  # Assign the column names from features.txt
  #--------------------------------------------------------------------
  varNames = read.table("./UCI HAR Dataset/features.txt", sep="")

  names(allMerged) <- c("Subject", "Activity", paste(varNames[,2]))

  
  #--------------------------------------------------------------------
  # Extract the required columns (mean and std cols) from data set 
  #--------------------------------------------------------------------
  allMeans <- allMerged[,grep("*mean\\(\\)", names(allMerged))] 
  allStds <- allMerged[, grep("*std\\(\\)", names(allMerged))]
  allMeansAndStds <- cbind(allMerged[1], allMerged[2],allMeans, allStds)

  #--------------------------------------------------------------------
  # Replace numbers with words for the activity types
  # 1 WALKING
  # 2 WALKING_UPSTAIRS
  # 3 WALKING_DOWNSTAIRS
  # 4 SITTING
  # 5 STANDING
  # 6 LAYING
  #--------------------------------------------------------------------
  allMeansAndStds$Activity[allMeansAndStds$Activity == 1]<-"WALKING"
  allMeansAndStds$Activity[allMeansAndStds$Activity == 2]<-"WALKING_UPSTAIRS"
  allMeansAndStds$Activity[allMeansAndStds$Activity == 3]<-"WALKING_DOWNSTAIRS"
  allMeansAndStds$Activity[allMeansAndStds$Activity == 4]<-"SITTING"
  allMeansAndStds$Activity[allMeansAndStds$Activity == 5]<-"STANDING"
  allMeansAndStds$Activity[allMeansAndStds$Activity == 6]<-"LYING"

  #--------------------------------------------------------------------
  # Give descriptive names to the variables (remove dodgy characters)
  #--------------------------------------------------------------------
  # Get rid of parentheses
  names(allMeansAndStds) <- gsub("mean\\(\\)", "Mean", names(allMeansAndStds)) 
  names(allMeansAndStds) <- gsub("std\\(\\)", "Std", names(allMeansAndStds)) 
  #   Get rid of hyphens
  names(allMeansAndStds) <- gsub("\\-", "", names(allMeansAndStds))

  #--------------------------------------------------------------------
  # Creates a second, independent tidy data set with the average of each 
  # variable for each activity and each subject 
  #--------------------------------------------------------------------
  allMelt <- melt(allMeansAndStds, id=c("Subject","Activity"))
  aveData <- dcast(allMelt, Subject + Activity ~ variable,mean)
  head(aveData)

  #--------------------------------------------------------------------
  # Write the tidy data set to a file called tidy.csv
  #--------------------------------------------------------------------
  if (!file.exists("./data")) { dir.create("./data")}
  write.table(aveData, file="./data/tidy.txt")
  
}
