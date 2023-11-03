The run_analysis.R script performs data cleaning in accordance with project discription.

Step 0 is a prepartion stage
 * dplyr library installed
 * dataset downloaded and extracted to folder called "data"
 * data assigned to variables:
     * features (561 rows, 2 columns) - contains features from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ
     * activities (6 rows, 2 columns) - contains a list of performed activities with corresponding code number
     * subject_test (2947 rows, 1 column) - contains a list of 9 out od 30 subject that test data was taken from
     * x_test (2947 rows, 561 column) - contains recorded features for test subjects
     * y_test (2947 rows, 1 column) - contains activity codes for test features
     * subject_train (7352 rows, 1 column) - contains a list of 21 out od 30 subject that test data was taken from
     * x_train (7352 rows, 561 column) - contains recorded features for train subjects
     * y_train (7352 rows, 1 column) - contains activity codes for train features <br>

Step 1 merges the training and the test sets to create one data set
* x_set (10299 rows, 561 column) - contains recorded features for test and train subject binded by rows
* y_set (10299 rows, 1 column) - contains activity codes for test and train features binded by rows
* subject_set (10299 rows, 1 column) - contains list of all 30 subjects, test and train subject binded by rows
* merged_data (10299 rows, 563 column) - contains all features, activity codes and subjects number binded by columns

Step 2 extracts only the measurements on the mean and standard deviation for each measurement
* tidy_data (10299 rows, 88 column) - created from merged_data by selecting columns: subject, code and features with "mean" or "std" in name

Step 3 names the activities in the data set
* column "code" from tidy_data replaced with corresponding activity name from variable activities

Step 4 labels the data set with descriptive variable names
* column "code" renamed to "activity
* words "BodyBody" in column names replaced with single word "Body"
* remaining variable names unchanged, further explication would result in very long variable names

Step 5 creates a second, independent tidy data set with the average of each variable for each activity and each subject
* av_data_set <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
  #Set 5.2 Saving tidy data set to txt file
write.table(av_data_set, "av_data_set.txt", row.names = FALSE)
