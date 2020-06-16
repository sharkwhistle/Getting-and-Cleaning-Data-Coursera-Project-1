library(dplyr)

# Get zip file/data for UCI HAR data
zipUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zipFile <- 'UCI HAR Dataset.zip'

if(!file.exists(zipFile)) {
        download.file(zipUrl, zipFile, mode = 'wb')
}

# Unzip dataset
path <- 'UCI HAR Dataset'
if(!file.exists(path)) {
        unzip(zipFile)
}

# Read activity labels and features
actLabels <- read.table('UCI HAR Dataset/activity_labels.txt')
actLabels[,2] <- as.character(actLabels[,2])
feat <- read.table('UCI HAR Dataset/features.txt')
feat[,2] <- as.character(feat[,2])

# Read Data, using only desired features (mean & std)
desFeat <- grep('.*mean.*|.*std.*', feat[,2])
desFeat.names <- feat[desFeat,2]
desFeat.names <- gsub('-mean','Mean',desFeat.names)
desFeat.names <- gsub('-std','Std',desFeat.names)
desFeat.names <- gsub('[-()]','',desFeat.names)

# Read in training and test data with specific mean/std cols only

# Train
train <- read.table('UCI HAR Dataset/train/X_train.txt')[desFeat]
trainAct <- read.table('UCI HAR Dataset/train/y_train.txt')
trainSub <- read.table('UCI HAR Dataset/train/subject_train.txt')
train <- cbind(trainSub,trainAct,train)

# Test
test <- read.table('UCI HAR Dataset/test/X_test.txt')[desFeat]
testAct <- read.table('UCI HAR Dataset/test/y_test.txt')
testSub <- read.table('UCI HAR Dataset/test/subject_test.txt')
test <- cbind(testSub,testAct,test)

# Merge data and rename columns, incl. actLabels
mergeData <- rbind(train,test)
colnames(mergeData) <- c('Subject','Activity',desFeat.names)
head(mergeData)

# Factorize subject and activity data
mergeData$Subject <- factor(mergeData$Subject)
mergeData$Activity <- factor(mergeData$Activity, levels = actLabels[,1], labels = actLabels[,2])

# Find mean for each variable and create new dataset mergeDataMeans
mergeDataMeans <- mergeData %>%
        group_by(Subject, Activity) %>%
        summarise_each(funs(mean))

# Write mergeDataMenas to tidy.txt
write.table(mergeDataMeans, 'tidy.txt', row.names = FALSE, quote = FALSE)
read.table('tidy.txt')
