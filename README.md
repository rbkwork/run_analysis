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



   features           activity            subject         value         
 Length:11880       Length:11880       Min.   : 1.0   Min.   :-0.99767  
 Class :character   Class :character   1st Qu.: 8.0   1st Qu.:-0.96205  
 Mode  :character   Mode  :character   Median :15.5   Median :-0.46989  
                                       Mean   :15.5   Mean   :-0.48436  
                                       3rd Qu.:23.0   3rd Qu.:-0.07836  
                                       Max.   :30.0   Max.   : 0.97451  
