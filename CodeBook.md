# Code Book for the tidy_data.csv output

## Pre-requisites

The UCI HAR dataset must be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

After unzipping, the top-level directory created must be renamed UCI_HAR_Dataset
and placed alongside this repo (ie. UCI_HAR_Dataset and Coursera_getdata-005_Project1
will be in the same directory).

## Running the analysis

From the command line, run the analysis as follows:

`R --vanilla < Coursera_getdata-005_Project1/run_analysis.R`

The output `tidy_data.csv` will be created in the current directory.

## Format of the tidy_data.csv output

The output CSV file has the following columns:

* subject - ID of the subject
* activity - name of the activity undertaken
* tBodyAcc.mean...X
* tBodyAcc.mean...Y
* tBodyAcc.mean...Z
* tBodyAcc.std...X
* tBodyAcc.std...Y
* tBodyAcc.std...Z

and so on for each of the following measures:
* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc
* fBodyAccJerk
* fBodyGyro
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag

## Processing steps

The analysis performs the following steps:

1. Read feature names from the feature.txt file.
1. Read the test data set, using feature names read in step 1.
1. Read the training data set, using feature names read in step 1.
1. Merge the test and training data sets
1. Discard all but mean and std columns for each measure.
1. Read the activity labels for the test data set.
1. Read the activity labels for the test data set.
1. Merge the test and training activity labels
1. Read the activity labels -> activity names table.
1. Join the labels and names in order to get named labels for whole data set
1. Merge in the activity names with our reduced data set
1. Read the subject IDs for the test data set.
1. Read the subject IDs for the training data set.
1. Merge the test and training subject IDs
1. Merge in the subject IDs with our reduced data set
1. Aggregate using mean, grouping across the combination of factors 'subject'
   and 'activity' to obtain final tidy data set.
1. Write results to a CSV file.

## Known Issues

The column names have not properly retained characters like '(', ')'.
These are replaced with period (.) characters in the CSV output.
This only affects the column names in the CSV header line.
