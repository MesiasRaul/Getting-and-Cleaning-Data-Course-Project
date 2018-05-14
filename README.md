## Geting and Cleanning Human Activity Recognition Using Smartphones Data Set

### Introduction:

The objective is prepare tidy data for future analysis.

The data source is [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Transformation Data:

Tha data is merged and cleaned with Run_analysis.R. The process in the code is:


## 1. Download Data:

Download data from the data source.

## 2. Read Data:

Read the *X_train* and *X_test* and join in only data.

## 3. Select mean and standard deviation variables:

The main variables is that meassurement of mean and standar deviation.

## 4. Rename Data:

It`s important that data has clear name variables. The code remove characters like "(", ")" or "-" and replace "t" for Time and "f" for Frequency.

## 5. Uses descriptive activity names to name the activities in the data set:

The *y_train* and *y_test* have the actvities indicator. It is necesary change the numbers of y_train and y_test for the names of *activity_labels*. Then add the subjects from the *subject_train* and *subject_test*.

## 6 Tidy Data: Average of each Variable for each activity and subject:

At the final the code obtain the average of each variable. This result save in **average_data**.

