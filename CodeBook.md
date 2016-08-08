# Code Book
This code book details the variables, the data, and all transformations that were performed to clean up the data.

## Raw Data
Raw data: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Original description of the raw data: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Transformations
### Tidy Data Set 1
1. Read in the activity labels (activity_labels.txt)
2. Read in the names of the measurements (features.txt)
3. Retain only the columns (feature names) that we need, i.e., only the measurements on the mean and standard deviation for each measurement
4. For both the training set and the test set;
    + Read in the measurements data (train/X_train.txt & test/X_test.txt), restricted to the columns we need (as per #3)
        + Merge the training and test measurement data sets
    + Read in the activity id data (train/y_train.txt & test/y_test.txt)
        + Merge the training and test activity id data sets
        + Replace activity ids with corresponding activity labels
    + Read in the subject data (train/subject_train.txt & test/subject_test.txt)
        + Merge the training and test subject data sets
5. Massage the feature/measurement names to make them a bit descriptive; try to make them camel case
6. Set the feature names as column names to the measurements data set
7. Combine the subject, activity labels, and measurements data frames

### Tidy Data Set 2
1. Group the 'Tidy Data Set 1' by activity, then by subject
2. Take the average (mean) of the remaining columns
3. Write this data set to a file (tidy_data.txt)

## Variables in the Tidy Data Set
Each variable is named as per the following pattern:
`[time|freq]Domain[Body|Gravity][Acc|Gyro]{Mag|JerkMag}[Mean|Std|MeanFreq].{X|Y|Z}`

1. `timeDomain/freqDomain`: time domain signals were captured at a constant rate of 50Hz, and FFT (fast fourier transforms) were applied to some signals to obtain frequency domain signals 
2. `Body/Gravity`: type of acceleration signal - body or gravity acceleration
3. `Acc/Gyro`: where the signal for this measurement came from - accelerometer or gyroscope
4. `Mag/JerkMag`: body linear acceleration and angular velocity were derived in time to obtain Jerk signals; magnitude of these three-dimensional signals were calculated using the Euclidean norm
5. `Mean/Std/MeanFreq`: mean value, standard deviation, and weighted average of the frequency components
6. `X/Y/Z`: denotes 3-axial signals in the X, Y and Z directions
