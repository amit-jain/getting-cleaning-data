## Function definition for method to tidy the dataset
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