# Getting and Cleaning Data Course Project - CODE BOOK

## Description
Additional information about the variables, data and transformations used in the course project for the Coursera's Getting and Cleaning Data course.

## Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Data Set Information
The experiments were carried out with a group of 30 volunteers 19-48 years old. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. The experiments were also video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Transformations

The original dataSet, composed of train and test data was processed in order to obtain the averages ot the values of the 6 activities performed by the 30 subjects.

The transformations carried out were:

- the training and the test sets were merged in one data set.
- the mean and standard deviation for each measurement were used in the analysis, the rest of the parameters were discarded
- the new data set uses descriptive activity names to name the activities (numbers in the original data set)
- the new data set labels each of the fields in the dataSet with descriptive variable names.
- means of he values aggregated by subject and activity were calculated

## Final Data Set contents

The new data set has a total of 180 observations over 79 variables

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
