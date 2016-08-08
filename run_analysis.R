library(dplyr)
library(data.table)

##
#runAnalysis()
#1. Merges the training and the test sets to create one data set
#2. Extracts only the measurements on the mean and standard deviation for each measurement
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names
##
runAnalysis <- function() {
    ##read in activity labels
    activityLabels <- read.table("./activity_labels.txt")[,2]

    ##read in features
    features <- read.table("./features.txt")[,2]

    ##we need only mean & std columns
    colsWeNeed <- grep("mean|std", features)


    ##read in X_train and X_test
    ##retain only the mean & std columns
    xTrain <- read.table("./train/X_train.txt")[,colsWeNeed]
    xTest <- read.table("./test/X_test.txt")[,colsWeNeed]
    ##merge xTrain and xTest
    xData <- rbind(xTrain, xTest)

    ##read in y_train and y_test
    yTrain <- read.table("./train/y_train.txt")
    yTest <- read.table("./test/y_test.txt")
    ##merge yTrain and yTest
    yData <- rbind(yTrain, yTest)
    ##replace activity ids with activity names
    yData <- as.data.table(activityLabels[yData[,1]])
    ##name the column
    names(yData) <- "activity"

    ##read in subject_train and subject_test
    subjectTrain <- read.table("./train/subject_train.txt")
    subjectTest <- read.table("./test/subject_test.txt")
    ##merge yTrain and yTest
    subjectData <- rbind(subjectTrain, subjectTest)
    ##name the column
    names(subjectData) <- "subject"


    ##massage feature names to make them descriptive
    featureNames <- as.character(features[colsWeNeed])
    ##remove ()
    featureNames <- sub("-mean\\(\\)", "Mean", featureNames)
    featureNames <- sub("-std\\(\\)", "Std", featureNames)
    featureNames <- sub("-meanFreq\\(\\)", "MeanFreq", featureNames)
    ##replace - with .
    featureNames <- gsub("-", ".", featureNames)
    ##replace first letters t & f with time. and freq.
    featureNames <- sub("^t", "timeDomain", featureNames)
    featureNames <- sub("^f", "freqDomain", featureNames)

    ##now name the columns for xData
    names(xData) <- featureNames

    ##bind subjectData, yData, and xData
    dataSet <- cbind(subjectData, yData, xData)
}

##
#avgByActivityAndSubject()
#From the data set returned by runAnalysis(), creates a second, independent tidy data set
#with the average of each variable for each activity and each subject
##
avgByActivityAndSubject <- function(dataSet) {
    tidyData <- dataSet %>%
                    group_by(activity, subject) %>%
                    summarise_each(funs(mean))

    write.table(tidyData, file = "./tidy_data.txt", row.names = FALSE)
}
