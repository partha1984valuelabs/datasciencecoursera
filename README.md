---
title: "README.md"
author: "Parthasarathi Chakraborty"
date: "Friday, April 17, 2015"
output: word_document
---

Getting and cleaning data peer assignment

Details of the workflow.

## Downloading data set
The data set has been downloaded from the URL given in the assignment page and it has been unziped in the Getting and cleaning data project dataset folder of my machine.My working directory has been set as
(D:/Datascience/COURSERA/COURSE PROJECTS/Getting and cleaning data project dataset/UCI HAR Dataset)

##Reading Data
A total of 28 txt files is there in the working directory out of which y_test.txt ,   y_test.txt,subject_train.txt,subject_test.txt,X_test.txt,X_train.txt were read. 


## Merges the training and the test sets to create one data set
Training and Testing datasets are mergerd

## Set the names of the variable of the new merged dataset
The names of the variable of the new merged datset are set.

## Merge columns to get the data frame Data for all data
The columns are merged so as to get a new dataset DATA.

## Extracts only the measurements on the mean and standard deviation for each measurement , Subset Name of Features by measurements on the mean and standard deviation

## Subset the data frame Data by seleted names of variables

The new dataset DATA is subsetted on selected variable name "subject" and "activity"
## Uses descriptive activity names to name the activities in the data set ,Read descriptive activity names from "activity_labels.txt"

## facorize Variale activity in the data frame Data using descriptive activity names

## Appropriately labels the data set with descriptive variable names


## Creates a second,independent tidy data set
















