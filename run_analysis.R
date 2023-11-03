#Step 0 Preparation
  #Step 0.1 Loading dplyr library
library(dplyr)
  # Step 0.2 Checking if folder "data" exists and downloading dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
  # Step 0.3 Unzipping dataset
unzip(zipfile="./data/Dataset.zip",exdir="./data")
  # Step 0.4 Assigning data frames
  #loading features and activity labels with assigning column names
features <- read.table("data/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
    #loading test data with assigning column names
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt", col.names = "code")
    #loading train data with assigning column names
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Step 1 Merging the training and the test sets to create one data set
x_set <- rbind(x_train, x_test)
y_set <- rbind(y_train, y_test)
subject_set <- rbind(subject_train, subject_test)
merged_data <- cbind(subject_set, y_set, x_set)

#Step 2 Extracting only the measurements on the mean and standard deviation for each measurement
tidy_data <- select(merged_data, subject, code, contains("mean"), contains("std"))

#Step 3 Using descriptive activity names to name the activities in the data set
tidy_data$code <- activities[tidy_data$code, 2]

#Step 4 Appropriately labeling the data set with descriptive variable names
names(tidy_data)[2] = "activity" 
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
#Remaining variable names unchanged. Further explication would result in very long variable names

#Step 5 Creating a second, independent tidy data set with the average of each variable for each 
#activity and each subject
  #Step 5.1 Creating variable with tidy data set
av_data_set <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
  #Set 5.2 Saving tidy data set to txt file
write.table(av_data_set, "av_data_set.txt", row.names = FALSE)