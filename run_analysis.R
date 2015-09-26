library(reshape2)

#loadDataSet takes the name of a dataset to load and the friendly labels for features 
#and activities. It returns a normalized tidy longform dataset
loadDataSet <- function(name, features, activities) {
  
  #load the subjects
  subjectData <- read.table(paste0("UCI HAR Dataset/",name,"/subject_",name,".txt"))
  names(subjectData) <- c("subject")
  
  #load the observations, keeping just mean and standard deviation
  xData <- read.table(paste0("UCI HAR Dataset/",name,"/X_",name,".txt"))
  names(xData) <- features
  xData <- xData[, grep("mean|std", colnames(xData))]
  
  #load the activities
  yData <- read.table(paste0("UCI HAR Dataset/",name,"/Y_",name,".txt"))
  names(yData) <- c("activityId")
  
  #combine the dataframes
  data <- cbind(subjectData, yData, xData)
  
  #merge the activity names into the dataframe and remove the unnecessary id column
  data <- merge(data, activities, by.x = "activityId", by.y = "activityId")
  data <- data[, !(colnames(data) %in% c("activityId"))]

  #convert the wide data form into a long data form and return
  data <- melt(data, id=c("subject", "activity"))
  names(data) <- c("subject", "activity", "observation", "value")
  data
}

#load the feature names
features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("featureId", "featureName")

#load the activity names
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("activityId", "activity")

#load the test and train data
testData <- loadDataSet("test", features$featureName, activities)
trainData <- loadDataSet("train", features$featureName, activities)

#combine into a single data frame
myData <- rbind(testData, trainData)
meanObservations <- aggregate(myData$value, by=list(myData$subject, myData$activity, myData$observation), FUN=mean)
names(meanObservations) <- c("subject", "activity", "observation", "mean")

#save the mean observations
write.table(meanObservations, file = "meanObservations.txt", row.names = FALSE)