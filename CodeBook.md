# getdata-033-project
# Course Project - Getting and Cleaning Data (getdata-033)

## Experiment
The study involved a group of 30 subjects with ages ranging from 19-48 and doing 6 different activities (walking, walking upstairs, walking downstairs, sitting, standing and laying). Various acceleration and velocity data were captured using the accelerometer and gyroscope inside a smartphone worn by them. The dataset of 10299 samples with 561 features were divided into two parts: training set (70%) and the test set (30%).
For details:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data files

The data files from the zip file ("getdata_projectfiles_UCI HAR Dataset.zip") included:

* info about all variables studied:
    * "features_info.txt"
    * "features.txt"
* training sets
    * "train/X_train.txt"
    * "train/y_train.txt"
* test sets
    * "test/X_test.txt"
    * "test/y_test.txt"
* mapping from y labels to activity names:
    * "activity_labels.txt"
* subject ids corresponding to row of training and test sets
    * "train/subject_train.txt"
    * "test/subject_test.txt"

## Extracted variables
Only the means and standard deviations of signals are used which account for 66 features (out of the 561 original ones). 
The following shows the column names of the merged data (i.e. data frame named "merged") with features properly renamed.
't' and 'f' stands for time signal and frequency domain signal respectively. 
'X', 'Y' or 'Z' at the end indicates the direction.

```
> dim(merged)
[1] 10299    68
```

```
> colnames(merged)
 [1] "subjectId"                "tBodyAccMeanX"           
 [3] "tBodyAccMeanY"            "tBodyAccMeanZ"           
 [5] "tGravityAccMeanX"         "tGravityAccMeanY"        
 [7] "tGravityAccMeanZ"         "tBodyAccJerkMeanX"       
 [9] "tBodyAccJerkMeanY"        "tBodyAccJerkMeanZ"       
[11] "tBodyGyroMeanX"           "tBodyGyroMeanY"          
[13] "tBodyGyroMeanZ"           "tBodyGyroJerkMeanX"      
[15] "tBodyGyroJerkMeanY"       "tBodyGyroJerkMeanZ"      
[17] "tBodyAccMagMean"          "tGravityAccMagMean"      
[19] "tBodyAccJerkMagMean"      "tBodyGyroMagMean"        
[21] "tBodyGyroJerkMagMean"     "fBodyAccMeanX"           
[23] "fBodyAccMeanY"            "fBodyAccMeanZ"           
[25] "fBodyAccJerkMeanX"        "fBodyAccJerkMeanY"       
[27] "fBodyAccJerkMeanZ"        "fBodyGyroMeanX"          
[29] "fBodyGyroMeanY"           "fBodyGyroMeanZ"          
[31] "fBodyAccMagMean"          "fBodyBodyAccJerkMagMean" 
[33] "fBodyBodyGyroMagMean"     "fBodyBodyGyroJerkMagMean"
[35] "tBodyAccStdX"             "tBodyAccStdY"            
[37] "tBodyAccStdZ"             "tGravityAccStdX"         
[39] "tGravityAccStdY"          "tGravityAccStdZ"         
[41] "tBodyAccJerkStdX"         "tBodyAccJerkStdY"        
[43] "tBodyAccJerkStdZ"         "tBodyGyroStdX"           
[45] "tBodyGyroStdY"            "tBodyGyroStdZ"           
[47] "tBodyGyroJerkStdX"        "tBodyGyroJerkStdY"       
[49] "tBodyGyroJerkStdZ"        "tBodyAccMagStd"          
[51] "tGravityAccMagStd"        "tBodyAccJerkMagStd"      
[53] "tBodyGyroMagStd"          "tBodyGyroJerkMagStd"     
[55] "fBodyAccStdX"             "fBodyAccStdY"            
[57] "fBodyAccStdZ"             "fBodyAccJerkStdX"        
[59] "fBodyAccJerkStdY"         "fBodyAccJerkStdZ"        
[61] "fBodyGyroStdX"            "fBodyGyroStdY"           
[63] "fBodyGyroStdZ"            "fBodyAccMagStd"          
[65] "fBodyBodyAccJerkMagStd"   "fBodyBodyGyroMagStd"     
[67] "fBodyBodyGyroJerkMagStd"  "activity"
```



## Output
The mean of each variable for each activity and each subject is also computed and 
the results is stored in data frame "summarised" which is saved as "summarised.txt".


```
> class(summarised)
[1] "grouped_df" "tbl_df"     "tbl"        "data.frame"
> dim(summarised)
[1] 180  68
> summarised
Source: local data frame [180 x 68]
Groups: subjectId [?]

   subjectId           activity tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ
       (int)             (fctr)         (dbl)         (dbl)         (dbl)
1          1            WALKING     0.2773308  -0.017383819    -0.1111481
2          1   WALKING_UPSTAIRS     0.2554617  -0.023953149    -0.0973020
3          1 WALKING_DOWNSTAIRS     0.2891883  -0.009918505    -0.1075662
4          1            SITTING     0.2612376  -0.001308288    -0.1045442
5          1           STANDING     0.2789176  -0.016137590    -0.1106018
6          1             LAYING     0.2215982  -0.040513953    -0.1132036
7          2            WALKING     0.2764266  -0.018594920    -0.1055004
8          2   WALKING_UPSTAIRS     0.2471648  -0.021412113    -0.1525139
9          2 WALKING_DOWNSTAIRS     0.2776153  -0.022661416    -0.1168129
10         2            SITTING     0.2770874  -0.015687994    -0.1092183
..       ...                ...           ...           ...           ...
Variables not shown: tGravityAccMeanX (dbl), tGravityAccMeanY (dbl),
  tGravityAccMeanZ (dbl), tBodyAccJerkMeanX (dbl), tBodyAccJerkMeanY (dbl),
  tBodyAccJerkMeanZ (dbl), tBodyGyroMeanX (dbl), tBodyGyroMeanY (dbl),
  tBodyGyroMeanZ (dbl), tBodyGyroJerkMeanX (dbl), tBodyGyroJerkMeanY (dbl),
  tBodyGyroJerkMeanZ (dbl), tBodyAccMagMean (dbl), tGravityAccMagMean (dbl),
  tBodyAccJerkMagMean (dbl), tBodyGyroMagMean (dbl), tBodyGyroJerkMagMean
  (dbl), fBodyAccMeanX (dbl), fBodyAccMeanY (dbl), fBodyAccMeanZ (dbl),
  fBodyAccJerkMeanX (dbl), fBodyAccJerkMeanY (dbl), fBodyAccJerkMeanZ (dbl),
  fBodyGyroMeanX (dbl), fBodyGyroMeanY (dbl), fBodyGyroMeanZ (dbl),
  fBodyAccMagMean (dbl), fBodyBodyAccJerkMagMean (dbl), fBodyBodyGyroMagMean
  (dbl), fBodyBodyGyroJerkMagMean (dbl), tBodyAccStdX (dbl), tBodyAccStdY
  (dbl), tBodyAccStdZ (dbl), tGravityAccStdX (dbl), tGravityAccStdY (dbl),
  tGravityAccStdZ (dbl), tBodyAccJerkStdX (dbl), tBodyAccJerkStdY (dbl),
  tBodyAccJerkStdZ (dbl), tBodyGyroStdX (dbl), tBodyGyroStdY (dbl),
  tBodyGyroStdZ (dbl), tBodyGyroJerkStdX (dbl), tBodyGyroJerkStdY (dbl),
  tBodyGyroJerkStdZ (dbl), tBodyAccMagStd (dbl), tGravityAccMagStd (dbl),
  tBodyAccJerkMagStd (dbl), tBodyGyroMagStd (dbl), tBodyGyroJerkMagStd (dbl),
  fBodyAccStdX (dbl), fBodyAccStdY (dbl), fBodyAccStdZ (dbl), fBodyAccJerkStdX
  (dbl), fBodyAccJerkStdY (dbl), fBodyAccJerkStdZ (dbl), fBodyGyroStdX (dbl),
  fBodyGyroStdY (dbl), fBodyGyroStdZ (dbl), fBodyAccMagStd (dbl),
  fBodyBodyAccJerkMagStd (dbl), fBodyBodyGyroMagStd (dbl),
  fBodyBodyGyroJerkMagStd (dbl)
```

