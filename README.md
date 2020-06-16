# Getting-and-Cleaning-Data-Coursera-Project-1
Final Project for Coursera Getting and Cleaning Data Course

1. Load dplyr library
2. Download data from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. Unzip data
4. Load Activity and Feature labels from the UCI HAR Dataset path (activity_label.txt, features.txt).
5. Define desired variables for final dataset (Mean, and Std in this case).
6. Load the Training and Test data along with from UCI HAR Path 
(X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt)
7. Merge Training and Test data into one data set (mergeData)
8. Summarize data with dplyr to return mean for each variable, and store in new dataset mergeDataMeans
9. Write final tidy dataset to txt file (tidy.txt)
