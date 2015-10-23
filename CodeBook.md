Whereas, CodeBook.md explains the steps so anyone can repeat the process.

With the help of the file: "features.txt"
mean and standard deviation variables are extracted from the data.

Rows of training sets and test sets are combined. The subject id is prepended while the activity is appended.
Column names of the merged dataset are baically taken from the features file and the names are further cleaned up.




The features extracted are the 
mean and standard deviation (Std) of variables calculated from signals recorded from 
accelerometer and gyroscope of the mibile phone.
2 examples are:
"fBodyBodyGyroMagStd" and "tGravityAccMagMean" where
't' stands for time signal while 'f' indicates frequency domain signal.



The study involved 30 subjects doing 6 different acitivites including:
1. walking
2. walking_upstairs
3. walking_downstairs
4. sitting
5. standing
6. laying

The dimension of the merged dataset is 10299 rows by 68 columns.
The subject id is the 1st column and the activity is the last one, with the signal variables in between.



