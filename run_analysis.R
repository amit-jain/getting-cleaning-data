library(plyr)

# Specify the dataset root directory
root = "UCI HAR Dataset"

# load the required tidy function
source('tidy.R')

## Read the features metadata
features <- read.table(file.path(root, "features.txt"))
activitylabels <- read.table(file.path(root, "activity_labels.txt"))

## Get required features from the features table (mean & std)
featuresreq <- features[grep("[Mm]ean|std", features[[2]]),]

## convert activity integer to descriptive strings
activityfact <- factor(activitylabels[[1]], labels=activitylabels[[2]])

## Read the test data
subject <- read.table(file.path(root, "test/subject_test.txt"))
testdata <- read.table(file.path(root, "test/X_test.txt"), strip.white = T)
activity <- read.table(file.path(root, "test/Y_test.txt"))

testdata <- tidyData(testdata, subject, activity)

## Read the train data
subject <- read.table(file.path(root, "train/subject_train.txt"))
traindata <- read.table(file.path(root, "train/X_train.txt"), strip.white = T)
activity <- read.table(file.path(root, "train/Y_train.txt"))

traindata <- tidyData(traindata, subject, activity)

## combine the 2 data sets
data <- rbind(testdata, traindata)

## Get a new df for the means across each subject and activity
meandata <- ddply(data,.(subject, activity), colwise(mean))

## Write out the file
write.csv(meandata, file = "tidydata.csv")

meandata
