# Getting and Cleaning Data Course Project CodeBook
This file contains information about the variables, the summary choices and the experimental study design used in the process of cleaning data.
## Variables
* The subject_test, x_test and y_test contain data from the test folder of the downloaded file.
* The subject_train, x_train and y_train contain data from the train folder of the downloaded file.
* The subject_data, x_data and y_data contain row-binded data.
* The features variable contains the appropriate column names for the x_data.
* The merged_data merges all the previous data into one variable.
* The mean_and_std is the subset of features, which contains all the column names with key word: 'mean' or 'std'.
* The merged_data_sub contains only the measurements on the mean and standard deviation for each measurement.
* The activity_labels contains the names of the activities with accordance to their number.
* The merged_data_average contains the tidy data set to be outputted.

## Processes
1. Checks for and creating directories
2. Download and unzip data from the web
3. Read data from the files
4. Merges the training and the test sets to create one data set
5. Appropriately labels the data set with descriptive variable names
6. Extracts only the measurements on the mean and standard deviation for each measurement
7. Find colnames with 'mean' or 'std'
8. Subset the merged data
9. Uses descriptive activity names to name the activities in the data set
10. Creates a second, independent tidy data set with the average of each variable for
11. Write the merged data with average into a txt file

## Output
The output of the project is a tidy data set with the average of each variable for each activity and each subject.

There are 30 subjects and 6 activities, so that the row number of the output file 'tidy_data.txt' is 180.

Check the output data by reading the txt file with the following code:

    read.table("data/tidy_data.txt", header = TRUE)
