setwd("~/UCI HAR Dataset/")
ActivityLabels <- read.table("activity_labels.txt")
MeasureLabels <- read.table("features.txt")
setwd("~/UCI HAR Dataset/test")
TestSubject <- read.table("subject_test.txt")
TestActivity <- read.table("y_test.txt")
TestData <- read.table("X_test.txt")
setwd("~/UCI HAR Dataset/train")
TrainSubject <- read.table("subject_train.txt")
TrainActivity <- read.table("y_train.txt")
TrainData <- read.table("X_train.txt")

TestFrame <- cbind(TestSubject,TestActivity,TestData)
colnames(TestFrame) <- c("Person","Activity",as.character(MeasureLabels[,2]))
TrainFrame <- cbind(TrainSubject,TrainActivity,TrainData)
colnames(TrainFrame) <- c("Person","Activity",as.character(MeasureLabels[,2]))
TotalData <- rbind(TestFrame,TrainFrame)
SubsetData <- cbind(TotalData[,1],TotalData[,2],TotalData[grepl("mean",colnames(TotalData))|grepl("std",colnames(TotalData))])
colnames(SubsetData) <- c("Person","Activity",colnames(SubsetData)[3:81])
library(plyr)
library(dplyr)
AvgData <- aggregate(SubsetData,list(SubsetData$Person,SubsetData$Activity),mean)
TidyData <- arrange(group_by(AvgData,Person,Activity))
TidyData$Activity[TidyData$Activity==1] <- "WALKING"
TidyData$Activity[TidyData$Activity==2] <- "WALKING_UPSTAIRS"
TidyData$Activity[TidyData$Activity==3] <- "WALKING_DOWNSTAIRS"
TidyData$Activity[TidyData$Activity==4] <- "SITTING"
TidyData$Activity[TidyData$Activity==5] <- "STANDING"
TidyData$Activity[TidyData$Activity==6] <- "LAYING"
TidyData <- TidyData[,3:ncol(TidyData)]
setwd("~/")
write.table(TidyData,file="TidyData.txt",row.names = FALSE)
write.csv(TidyData,file="TidyData.csv",row.names = FALSE)
     