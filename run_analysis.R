library(data.table)
library(tidyverse)
library(reshape2)
setwd("D:/R projects/coursera/run_analysis/UCI HAR Dataset (1)")

temp <- list.files(pattern="*.txt",all.files = T)    #take archive path
temp_names<-sub(".txt","",temp)%>%tolower()            #use paths to make names (all in lower-case)
names(temp) <- basename(temp_names)               #put corresponding names to the data so plyr makes columns names 
data_info<- lapply(temp, fread)         #it creates a list with all the data

##1 Merges the training and the test sets to create one data set.
data<-rbind(cbind(data_info$x_test,data_info$subject_test,data_info$y_test),cbind(data_info$x_train,data_info$subject_train,data_info$y_train)) 

##2 Extracts only the measurements on the mean and standard deviation for each measurement.
names(data)<-c(1:561,"subject","activity")         #it needs unique names
features<-data_info[["features"]][["V2"]]          #a table with the names
data<-select(data,c("subject","activity"),grep("mean[/(][/)]|std[/(][/)]",features))       #take the names from the info to filter and filter the data

##3 Uses descriptive activity names to name the activities in the data set
data<- merge(data_info[["activity_labels"]],data,by.x = "V1",by.y = "activity")           # use the activity names stored in the file
data<- data[,-1]              #delete the column which was used to merge

##4 Appropriately labels the data set with descriptive variable names.
names(data)<-c("activity","subject",grep("mean[/(][/)]|std[/(][/)]",features,value = T))   #name all the columns but they are not unique


##5 From the data set in step 4, creates a second, independent tidy data set with the 
##  average of each variable for each activity and each subject
data<-pivot_longer(data,3:68,"features")                     #gather the variables in a column
tidy_data<- dcast(data,features+activity+subject~ .,mean)   #makes a table that obtains the mean value for each observation
tidy_data<-rename(tidy_data, value = ".")        
tidy_data$subject<- as.numeric(tidy_data$subject) 


write.table(tidy_data,file="./tidydata") #make a file with the data table

