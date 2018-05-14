# 1. Download Data: ####

rm(list = ls())

setwd("C:/Users/RAUL/Desktop/PC/2.Estudio/6.Data_Science/Curso3_Getting_and_Cleaning_Data/Week4")

if (!file.exists("Data")) file.create("./Data")

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "./Data/SamsungGalaxy.zip")

unzip(zipfile = "./Data/SamsungGalaxy.zip",exdir = "./Data")

setwd("./Data/UCI HAR Dataset")

# 2. Read Data: ####

x_train = read.table(file = "./train/X_train.txt")
x_test = read.table(file = "./test/X_test.txt")

data = rbind(x_train,x_test) 

rm(x_train,x_test)

# 3. Select mean and standard deviation variables ####

features_names = read.table(file = "./features.txt")
features_names = features_names[,2]

names(data) = features_names

measures_selected = grep(pattern = "(mean|std)\\(",x = names(data),value = T)

data = data[,measures_selected]

head(data[,1:5])

# 4. Rename Data: ####

names(data) = gsub(pattern = "BodyBody",replacement = "Body",x = names(data))
names(data) = sub(pattern = "^t",replacement = "Time",x = names(data))
names(data) = sub(pattern = "^f",replacement = "Frequency",x = names(data))
names(data) = gsub(pattern = "(\\(|\\)|\\-)",replacement = "",x = names(data))
names(data) = gsub(pattern = "mean",replacement = "Mean",x = names(data))
names(data) = gsub(pattern = "std",replacement = "Std",x = names(data))

names(data)

# 5. Uses descriptive activity names to name the activities in the data set ####

# Activities:

activities_train = read.table(file = "./train/y_train.txt")
activities_test = read.table(file = "./test/y_test.txt")

activities = rbind(activities_train,activities_test)

activities = activities$V1

rm(activities_test,activities_train)

labels = c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")

activities = labels[activities]

data = cbind(Activity = activities,data)

# Subjects:

subjects_train = read.table(file = "./train/subject_train.txt")
subjects_test = read.table(file = "./test/subject_test.txt")

subjects = rbind(subjects_train,subjects_test)

rm(subjects_train,subjects_test)

subjects = subjects$V1

data = cbind(Subjects = subjects,data)

# 6 Tidy Data: Average of each Variable for each activity and subject:: ####

suppressMessages(library(dplyr))

average_data = data %>%
    group_by(Subjects,Activity) %>%
    summarise_all(.funs = mean)

write.table(x = average_data,
            file = "C:/Users/RAUL/Desktop/PC/2.Estudio/6.Data_Science/Curso3_Getting_and_Cleaning_Data/Week4/Assignment/tidy_data.txt",
            row.names = T)
