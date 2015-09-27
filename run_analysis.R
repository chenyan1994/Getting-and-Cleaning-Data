## This program prepares tidy data that can be used for later analysis.
## It has the following five steps:
## (1) merges the training and the test sets to create one data set.
## (2) Extracts only the measurements on the mean and standard deviation for 
## each measurement. 
## (3) Uses descriptive activity names to name the activities in the data set.
## (4) Appropriately labels the data set with descriptive variable names. 
## (5) From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

library(plyr)

## Checks for and creating directories
if (!file.exists("data")) {
        dir.create("data")
}


## Download and unzip data from the web
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "Dataset.zip", method = "curl")
unzip("Dataset.zip", exdir = "data")


## Read data from the files
## Read test data
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
## Read train data
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")


## Merges the training and the test sets to create one data set
subject_data <- rbind(subject_test, subject_train)
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
## Appropriately labels the data set with descriptive variable names
features <- read.table("data/UCI HAR Dataset/features.txt")
colnames(x_data) <- features[, 2]
colnames(subject_data) <- "Subject"
colnames(y_data) <- "Activity"
## Merge data
merged_data <- cbind(subject_data, y_data, x_data)


## Extracts only the measurements on the mean and standard deviation for each measurement
## Find colnames with 'mean' or 'std'
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])
## Subset the merged data
merged_data_sub <- cbind(merged_data[, 1:2], merged_data[, (mean_and_std + 2)])


## Uses descriptive activity names to name the activities in the data set
## Read activity labels from the file
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")
## Replace 1:6 with the activity respectively
merged_data_sub[, 2] <- activity_labels[merged_data_sub[, 2], 2]


## Creates a second, independent tidy data set with the average of each variable for
## each activity and each subject
merged_data_average <- ddply(merged_data_sub, .(Subject, Activity), 
                             .fun = function(x){colMeans(x[, -c(1, 2)])})


## Write the merged data with average into a txt file
write.table(merged_data_average, file = "data/tidy_data.txt", row.names = FALSE)


