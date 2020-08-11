# Getting and Cleaning Data Course Project

The data "Human Activity Recognition Using Smartphones Data Set" used in this assingment was taken from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* It merges the training and the test sets to create one data set with their respective subject and activity labels.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* And it creates a second, independent tidy data set with the average of each variable for each activity and each subject, 
**which meets the principles of:**

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table

from <http://vita.had.co.nz/papers/tidy-data.pdf>

## Files explanation
The file with the scrip and all the process is `run_analysis.R` it can run as long as the data is in the working directory
In file `codebook.Rmd` is the Code Book that explains the variables in The tidy data set is in the `tidydata` file but it can be read automatially in your computer by entering the following script:

```{r}
address <- "https://raw.githubusercontent.com/rbkwork/run_analysis/master/tidydata"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE)
View(data)
```

# Code Book


| Variable  | Type | Description |
|--------|-------|---------|
|features|character| This are the signals explained in the features_info file, but only the set of variables estimated mean and str|
| activity | character | The six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed |
| subject | numeric | A number for each of the 30 person who performed the activity |
| value | numeric | The mean of the values estimated for each observation |

   features        
 Length:11880      
 Class :character  
 Mode  :character  
                   
                   
                   
   activity        
 Length:11880      
 Class :character  
 Mode  :character  
                   
                   
                   
   subject    
 Min.   : 1.0  
 1st Qu.: 8.0  
 Median :15.5  
 Mean   :15.5  
 3rd Qu.:23.0  
 Max.   :30.0 
 
 
   value         
 Min.   :-0.99767  
 1st Qu.:-0.96205  
 Median :-0.46989  
 Mean   :-0.48436  
 3rd Qu.:-0.07836  
 Max.   : 0.97451 


Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals and used in the table are: 

mean(): Mean value
std(): Standard deviation

The complete list of variables of each feature vector is available in 'features.txt'
