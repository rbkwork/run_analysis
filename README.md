# run_analysis
Getting and Cleaning Data Course Project

The data "Human Activity Recognition Using Smartphones Data Set" used in this assingment was taken from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


It merges the training and the test sets to create one data set with their respective subject and activity labels.

Extracts only the measurements on the mean and standard deviation for each measurement.

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive variable names.

And it creates a second, independent tidy data set with the average of each variable for each activity and each subject.


and then generates a tidy data text file that meets the principles of:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table

from <http://vita.had.co.nz/papers/tidy-data.pdf>


The tidy dataset can be read
```{r}
address <- "https://s3.amazonaws.com/coursera-uploads/user-longmysteriouscode/asst-3/massivelongcode.txt"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE)
View(data)
```



There is an codebook with the specific description of the tidy data file contents with the units of eache