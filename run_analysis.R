library(plyr)

## Helper method to tidy the data
tidyData <- function(data, subject, activity) {
  ## trim the dataframe to the required features and add meaningful feature names to the dataframe
  colnames(data) <- unlist(as.vector(features[[2]]))
  trimmeddata <- data[, unlist(as.vector(featuresreq[[1]]))]
  
  ## add subject and activity and add appropriate columns names
  colnames(activity) <- c("activity")
  colnames(subject) <- c("subject")
  trimmeddata <- cbind(trimmeddata, subject)
  trimmeddata <- cbind(trimmeddata, activity)
  
  trimmeddata$activity <- activityfact[trimmeddata$activity]
  trimmeddata
}

## Read the features metadata
features <- read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")

## Get required features from the features table (mean & std)
featuresreq <- features[grep("[Mm]ean|std", features[[2]]),]

## convert activity integer to descriptive strings
activityfact <- factor(activitylabels[[1]], labels=activitylabels[[2]])

## Read the test data
subject <- read.table("test/subject_test.txt")
testdata <- read.table("test/X_test.txt", strip.white = T)
activity <- read.table("test/Y_test.txt")

testdata <- tidyData(testdata, subject, activity)

## Read the train data
subject <- read.table("train/subject_train.txt")
traindata <- read.table("train/X_train.txt", strip.white = T)
activity <- read.table("train/Y_train.txt")

traindata <- tidyData(traindata, subject, activity)

## combine the 2 data sets
data <- rbind(testdata, traindata)

## Get a new df for the means across each subject and activity
meandata <- ddply(data,.(subject, activity), colwise(mean))
meandata

## Write out the file
write.csv(meandata, file = "tidydata.csv")

