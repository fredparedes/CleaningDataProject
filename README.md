# CleaningDataProject
This project if for the JHU coursera course Getting and Cleaning Data. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis from the Human Activity Recognition Using Smartphones Data Set from University California Irvine (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

Files Included:

run_analysis.R - R script that takes reads and creates the tidy data sets 
The data set used the following files to create the tidy data sets:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Tidy_Complete_HAR.csv - Tidy data csv of the complete HAR information created from the run_analysis.R script.

Tidy_Mean_Subject_Activity.csv - Subset of the Tidy_Complete_HAR that includes mean, subject and activity information that is created from the run_analysis.R script. 


Reference: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

