# 03/12/2019
#
# This script was developed for the Getting and Cleaning Data project by JHU on Coursera.org
#
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis.
#

# this script requires dplyr package
library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")

# Merges the training and the test sets to create one data set.

# Merge the test and training data sets

Subject_X_Test_data <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/UCI HAR Dataset/test/X_test.txt", quote = "\"", stringsAsFactors = FALSE)
Subject_X_Train_data <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/UCI HAR Dataset/train/X_train.txt", quote = "\"", stringsAsFactors = FALSE)

# Merge the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Subject_Train <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/UCI HAR Dataset/train/subject_train.txt", quote="\"", stringsAsFactors=FALSE)
Subject_Test <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/UCI HAR Dataset/test/subject_test.txt", quote="\"", stringsAsFactors=FALSE)

# Create a single data set with test and training data
X_Test_Train_data_all <- bind_rows(Subject_X_Train_data, Subject_X_Test_data) 

# Create a single data set with subject of the test and training 
X_Test_Train_subject_all <- bind_rows(Subject_Train, Subject_Test)

# 'features.txt': List of all features column labels

All_Features <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)

# clean up column names in All_Features by removing special character and changing to lower case
All_Features$V2 <- tolower(All_Features$V2)

# not all variables are unique so append the column number to the name 

All_Features$V2 <- paste(All_Features$V2, All_Features$V1, sep = "-")

# Appropriately labels the data set with descriptive variable names.
# Add names to the columns for data
names(X_Test_Train_data_all) = All_Features$V2
names(X_Test_Train_subject_all) = c("subject")

# Add the subject column to X_Test_Train_data_All data frame

X_Test_Train_data_all <- cbind(X_Test_Train_data_all, X_Test_Train_subject_all)


# 'activity_labels.txt': Links the class labels with their activity name.

Activity_Labels <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/UCI HAR Dataset/activity_labels.txt", quote="\"", stringsAsFactors=FALSE)

Subject_Y_Test_data <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/UCI HAR Dataset/test/y_test.txt", quote = "\"", stringsAsFactors = FALSE)
Subject_Y_Train_data <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/UCI HAR Dataset/train/y_train.txt", quote = "\"", stringsAsFactors = FALSE)

# combine the label data sets
Subject_Y_Test_Train_data_all <- bind_rows(Subject_Y_Train_data, Subject_Y_Test_data)

# merge the activity with the descriptive label 
Subject_Activity <- merge(Subject_Y_Test_Train_data_all, Activity_Labels, by.x = "V1", by.y = "V1", all = TRUE)

# label columns with descriptive names
names(Subject_Activity) = c("activitynumber", "activityname")

#-----------------------------------------------------------------------------
# descriptive activity names to name the activities in the data set
# combine the activity labels with the data
Complete_Test_Train <- cbind(X_Test_Train_data_all, Subject_Activity)
# output to csv
write.csv(Complete_Test_Train, "/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/Tidy_Complete_HAR.csv")


# Extracts only the measurements on the mean into independent tidy data set 
# with the average of each variable for each activity and each subject.
Test_Train_Mean <- select(Complete_Test_Train, contains("mean"))
Test_Train_Mean_Subject<- cbind(Test_Train_Mean,X_Test_Train_subject_all)
Test_Train_Mean_Subject_Activity <- cbind(Test_Train_Mean_Subject, Subject_Activity)
# output to csv
write.csv(Test_Train_Mean_Subject_Activity, "/Users/fredparedes/Documents/Data Science Course/Class/CleaningDataProject/Tidy_Mean_Subject_Activity.csv")

# clean up
rm(Subject_Activity)
rm(Subject_Y_Test_Train_data_all)
rm(Subject_Y_Train_data)
rm(Subject_Y_Test_data)
rm(Activity_Labels)
rm(All_Features)
rm(X_Test_Train_subject_all)
rm(X_Test_Train_data_all)
rm(Subject_Test)
rm(Subject_Train)
rm(Subject_X_Train_data)
rm(Subject_X_Test_data)
rm(Complete_Test_Train)
rm(Test_Train_Mean)
rm(Test_Train_Mean_Subject)
rm(Test_Train_Mean_Subject_Activity)