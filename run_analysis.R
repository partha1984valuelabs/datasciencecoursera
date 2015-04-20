

setwd(H:/Rlib/GETTING AND CLEANING DATA/UCI HAR Dataset")
getwd()
list.files()
path_rf <- file.path("H:/Rlib/GETTING AND CLEANING DATA/UCI HAR Dataset")
getwd()
#Reading Data
dataActivityTest  <- read.table(file.path(path_rf , "y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "y_train.txt"),header = FALSE)


dataSubjectTrain <- read.table(file.path(path_rf, "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "subject_test.txt"),header = FALSE)


dataFeaturesTest  <- read.table(file.path(path_rf , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "X_train.txt"),header = FALSE)

str(dataActivityTest)
str(dataActivityTrain)
str(dataSubjectTrain)
str(dataSubjectTest)
str(dataFeaturesTest)
str(dataFeaturesTrain)

#Merges the training and the test sets to create one data set
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

#set names to variables
dim(dataSubject)
names(dataSubject)<-c("subject")
names(dataActivity)<-c("activity")

dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2


  #Merge columns to get the data frame Data for all data
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)



#Extracts only the measurements on the mean and standard deviation for each measurement
#Subset Name of Features by measurements on the mean and standard deviation

subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
subdataFeaturesNames

#Subset the data frame Data by seleted names of Features

selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

#Check the structures of the data frame Data
str(Data)

#Uses descriptive activity names to name the activities in the data set
#Read descriptive activity names from "activity_labels.txt"

activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

  #facorize Variale activity in the data frame Data using descriptive activity names
head(Data$activity,30)


#Appropriately labels the data set with descriptive variable names

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#Check
names(Data)

#Creates a second,independent tidy data set and ouput it

library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)




tidydata <- read.table(file.path(path_rf , "tidydata.txt" ),header = TRUE)
names(tidydata)
ncol(tidydata)
































