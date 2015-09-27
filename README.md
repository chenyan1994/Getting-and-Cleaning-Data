# Getting-and-Cleaning-Data
This repository contains codes and files for the project of Coursera course: Getting and Cleaning Data

The data used in this project is from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### File description
#### run_analysis.R
This R source file contains all the necessary code for meeting the 5 requirements of this project:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to use run_analysis.R, simply import it into RStudio, and run all the code.
#### CodeBook.md
This file contains information about the variables, the summary choices and the experimental study design used in the process of cleaning data.

#### tidy_data.txt
This file is the output of run_analysis.R, which is a tidy data set. 
