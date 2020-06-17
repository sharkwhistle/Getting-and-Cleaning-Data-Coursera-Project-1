# Repository contents
1. README.md
2. run_analysis.R
3. CodeBook.md
4. tidy.txt

This repository contains the final files for the Getting and Cleaning Data Project for Coursera's Data Science Course.

The dataset used for this analysis is the Human Activity Recognition Using Smartphones dataset found at the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The analysis combines training and test data from the UCI HAR analysis, which are divided into the following files:
X_train.txt
y_train.txt
subject_train.txt
X_test.txt
y_test.txt
subject_test.txt
activity_labels.txt
features.txt

The run_analysis.R script reads all of these individual files and combines them into 1 tidy dataset.
It then summarizes the information contained in this dataset by taking the average of each variable.
This dataset is then written to a new txt file called tidy.txt.
