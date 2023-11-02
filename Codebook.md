The run_analysis.R script performs data cleaning in accordance with project discription.

Step 0. Preparation stage
 * dplyr library installed
 * dataset downloaded and extracted to folder called "data"
 * data assigned to variables:
     * features
     * activities
     * subject_test
     * x_test
     * y_test
     * subject_train
     * x_train
     * y_train <br>

Step 1. Merge the training and the test sets to create one data set
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
#Remaining variable names unchanged. Further explication would result in very long variable names

#Step 5 Creating a second, independent tidy data set with the average of each variable for each 
#activity and each subject
  #Step 5.1 Creating variable with tidy data set
av_data_set <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
  #Set 5.2 Saving tidy data set to txt file
write.table(av_data_set, "av_data_set.txt", row.names = FALSE)
