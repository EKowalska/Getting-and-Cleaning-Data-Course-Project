This repository contains Peer-graded Assignment for Getting and Cleaning Data Course Project. 
***

Dataset: Human Activity Recognition Using Smartphones from http://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones
***

Files:

  * Codebook.md - code book containg a descirption of variables, data and steps taken to clean up the data set<br>
  * run_analysis.R - script that performs 5 steps:<br>
    1. Merges the training and the test sets to create one data set.<br>
    2. Extracts only the measurements on the mean and standard deviation for each measurement.<br>
    3. Uses descriptive activity names to name the activities in the data set.<br>
    4. Appropriately labels the data set with descriptive variable names.<br>
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br>
  * av_data_set.txt - final data step, after transformations mentioned above, exported to text file
