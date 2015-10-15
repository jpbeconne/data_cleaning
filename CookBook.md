# Project of Getting and Cleaning Data course on Coursera

The project consists in getting and cleaning data measured by a portable computing during human activity.
Inertial signal files have been ignored because I could'nt figure out their 128 variables
The R script performs the folowwing steps :
1- download the file
2- unzip the file
3- read references data : column names and activity identifiers with label
4- read test data : subject identifiers, activity identifiers and measures
5- create test data set
6- read train data : subject identifiers, activity identifiers and measures
7- create train data set
8- merge test data set and train data set
9- identify columns containing mean and standard deviation columns. meanFreq is ignored.
10- create data set with the columns identified in 9 plus subject identifier and activity label
11- Cleaning column names : remove '.', '-' characters and use capitals for mean and std
12- Create a new data set containing average value on measurement for each subject and activity. Procedure : transform all measurements columns in variable/value pair with melt function, calculate the mean for each subject and activity then transform back each variable/value pairs to column
13- writing the last data set to

Final data set description :
- subject : suject identifier
- activity_name : activity label
- measurement variables with a structured name :
  - beginning letter: t for time, f for fast Fourier Transform
  - second part : type of measure (body acceleration , gravity acceleration, ...)
  - third part : Mean or Std for measurement mean and standard deviation
  - Optionnal last part : axis (X,Y or Z)
 
List of variables :
subject
activity_name
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagMean
tBodyAccMagStd
tGravityAccMagMean
tGravityAccMagStd
tBodyAccJerkMagMean
tBodyAccJerkMagStd
tBodyGyroMagMean
tBodyGyroMagStd
tBodyGyroJerkMagMean
tBodyGyroJerkMagStd
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyAccMagMean
fBodyAccMagStd
fBodyBodyAccJerkMagMean
fBodyBodyAccJerkMagStd
fBodyBodyGyroMagMean
fBodyBodyGyroMagStd
fBodyBodyGyroJerkMagMean
fBodyBodyGyroJerkMagStd

