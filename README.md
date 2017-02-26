# Getting and Cleaning Data Course Project

## Introduction
This repository contains my submission for the peer graded assignment as part of the Coursera course "Getting and Cleaning Data" (Data Science Specialization by Johns Hopkins University).

The problem definition for this project is to read in the data set [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and output a tidy data set after performing the following processing:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Setup
1. Download the data set from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the data set zip file and cd (change directory) to "UCI HAR Dataset"
3. Prerequisites - the packages "dplyr" and "data.table"
4. run_analysis.R, found in this project, defines two functions
    + runAnalysis() - executes steps #1-#4 and returns a tidy data set as per specification
    + avgByActivityAndSubject(dataSet) - executes step #5 and writes the second tidy data set to a file "tidy_data.txt" in the current directory

## Steps to Run
* `source("./run_analysis.R")`
* `tidyDataSet <- runAnalysis()` - this is the first tidy data set
* `avgByActivityAndSubject(tidyDataSet)` - this will generate a file `./tidy_data.txt` which contains the second tidy data set

## Code Book
This repository contains a CodeBook.md which details the variables, the data and all transformations that were performed to clean up the data.
