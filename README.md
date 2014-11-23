coursera-getting-and-cleaning-data
==================================

This repository contains the solution to the project for the coursera class: Getting and Cleaning Data.

The solution script, run_analysis.R included in this repository, acts on the the dataset derived from the "Human Activity Recognition Using Smartphones Data Set" made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script produces the space-separated result data set, tidy.txt also made available in this repository.

Descrition
----------
run_analysis.R reads the training and test data sets and merges the two together resulting in 563 features. Then the scrit extracts the mean and standard deviation for each measurement, which reduces the total number of features to 88. 
We then attribute to each feature a descriptive activity name produced from the 'activity_labels.txt' file.

Lastly, the script produces a tidy data set named tidy.txt with the average of each variable for each activity and each subject.

