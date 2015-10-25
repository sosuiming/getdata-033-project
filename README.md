# getdata-033-project
# Course Project - Getting and Cleaning Data (getdata-033)

## Author

smso <smso@graduate.hku.hk>

## Requisite for running run_analysis.R

Download and unzip to the same folder as the .R file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
(or refers to the course page for an updated link)


## Source of data

Data are taken from the "Human Activity Recognition Using Smartphones Dataset". Detailed description can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Workings of run_analysis.R

The following simplified steps are done:
(see also the inline comments)
* column indices corresponding to the means and standardard deviations of signals are computed from "features.txt"
* filtered x data of the test set and and training set are merged
* y data of the test set and and training set are merged
* the activity column of merged y data is converted to factors with proper levels
* a big data is formed from merging the x and y data, with the subject id column prepended
* columns of the merged data are renamed
* mean of each variable for each activity and each subject is computed with the results saved to a text file "summarised.txt"

