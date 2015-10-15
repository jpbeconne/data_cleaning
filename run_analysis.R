# Download the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "FUCI_HAR.zip")
# Unzip file
unzip("FUCI_HAR.zip")

#Reading column name
column_names<-read.table(file = "UCI HAR Dataset\\features.txt",header = FALSE,col.names = c("col_id","col_name"))
#Reading activity labels
activity<-read.table(file = "UCI HAR Dataset\\activity_labels.txt",header = FALSE,col.names = c("activity_id","activity_name"))
# Reading test subject
subject_test<-read.table(file = "UCI HAR Dataset\\test\\subject_test.txt",header = FALSE,col.names = c("subject"))
# Reading test vectors
x_test<-read.table(file = "UCI HAR Dataset\\test\\X_test.txt",header = FALSE,col.names = column_names$col_name)
# Reading test response
y_test<-read.table(file = "UCI HAR Dataset\\test\\y_test.txt",header = FALSE,col.names = c("activity_id"))

# Creating test data set
test_data<-cbind(y_test,subject_test,x_test)

# Reading train subject
subject_train<-read.table(file = "UCI HAR Dataset\\train\\subject_train.txt",header = FALSE,col.names = c("subject"))
# Reading test vectors
x_train<-read.table(file = "UCI HAR Dataset\\train\\X_train.txt",header = FALSE,col.names = column_names$col_name)
# Reading test response
y_train<-read.table(file = "UCI HAR Dataset\\train\\y_train.txt",header = FALSE,col.names = c("activity_id"))

# Creating test data set
train_data<-cbind(y_train,subject_train,x_train)

# Merge test and train data set
all_data<-rbind(test_data,train_data)

# Identify variables related to mean and standard deviation (meanFreq is ignored)
selected_variables=gsub("(-|\\(|\\))",".",column_names[grep(".*(mean\\(\\)|std).*",column_names$col_name),2])

# Dataset with only mean and standard deviation
data_mean_std<-subset(all_data,select = c(c("activity_id","subject"),selected_variables))

# Use activity label
data_mean_std_act<-subset(merge(data_mean_std,activity,by = "activity_id"),select=-c(1))

# Cleanning column name : 
#  - replacing single or successive "." by "".
#  - replacing "-" by ""
#  -replacing respectively "mean" and "std" by "Mean" and "Std"

clean_col_name<-gsub("std","Std",gsub("mean","Mean",gsub("(\\.)+|-","",colnames(data_mean_std_act))))
colnames(data_mean_std_act)<-clean_col_name

# In order to create new tidy data set with average column :
# 1- transform columns to values with melt
# 2- transform values to columns with dcast
install.packages("reshape2",dependencies = TRUE)
library(reshape2)
new_tidy<-melt(data_mean_std_act,id=c("subject","activity_name"))
final_tidy<-dcast(new_tidy,subject+activity_name~variable,fun.aggregate = mean)
write.table(final_tidy, row.names = FALSE,file="tidy_data.txt")
