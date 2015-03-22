## Don't forget to setwd(DirectoryWithSamsungData)
# setwd(DirectoryWithSamsungData) 
## in my computer:
## setwd("C:/R/Getting and clearing data quizzes/CourseProject/UCI HAR Dataset")
## Clear workspace
# rm(list=ls())

########################################################################
# Extract basic information about the features recorded
# Read file
features <- read.table("features.txt")
# From the recorded features extract which indexex/columns
# include means or Standard Deviations
# I do it with the base:::grep() function
meanIndexes <- grep("mean", as.character(features[,2]), fixed = F)
stdIndexes <- grep("std", as.character(features[,2]), fixed = F)

# Mix both vectors in an organized way, I use the base:::union function
# and sort() the result
meanAndStdIndexes <- sort(union(meanIndexes,stdIndexes))

# Extract basic information about the activity labels
# so I have the name of the different activities and their codification
activityLabels <- read.table("activity_labels.txt")

########################################################################
# Extract the data from the train set
setwd("train")
x_train <- read.table("x_train.txt")

# Subset the means and std and name them appropiately
x_trainFiltered <- x_train[,meanAndStdIndexes]
colnames(x_trainFiltered )<-features[meanAndStdIndexes,2]

# Extract the activities from y_train.txt and name it
y_train <- read.table("y_train.txt")
colnames(y_train) <- "Activity"

# Same with subjects from subject_train.txt
subject_train <- read.table("subject_train.txt")
colnames(subject_train) <- "Subject"

# Put everything together into a data.frame
trainSet <- data.frame(cbind(y_train,subject_train, x_trainFiltered))
# For the first column and using activityLabels as a dictionary
# change activity numbers for activity names
trainSet[,1]<-activityLabels[trainSet[,1],2]

########################################################################
# Now do the same from the test set
# Extract the data from the test set
setwd("../")
setwd("test")
x_test <- read.table("x_test.txt")
x_testFiltered <- x_test[,meanAndStdIndexes]
colnames(x_testFiltered )<-features[meanAndStdIndexes,2]

y_test <- read.table("y_test.txt")
colnames(y_test) <- "Activity"

subject_test <- read.table("subject_test.txt")
colnames(subject_test) <- "Subject"

testSet <- data.frame(cbind(y_test,subject_test, x_testFiltered))
testSet[,1]<-activityLabels[testSet[,1],2]

########################################################################
# Merge Both Datasets

allData <- rbind(trainSet, testSet) # According to the course project instructions
                                      # this is the data set of point 4

# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
# Plyr library is used in this final step
library(plyr)
# we use all_data for this, and an anonymus function to calculate means
finalSet <- ddply(allData, .(Subject, Activity), function(x) colMeans(x[, 3:81]))

# Write final result in a txt file
setwd("../")# I go up a directory so the file doesn't get lost in the test directory
write.table(finalSet, "CourseProjectfinalSet.txt", row.name = F)
