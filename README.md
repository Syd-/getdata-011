Getting and Cleaning Data Course Project
===================
**Sid M**

----------
Prerequisites
---
- Ensure that there's a directory called ```UCI HAR Dataset``` under the directory you clone this repository to. You can get the files for the directory from this [link](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip) .
- Ensure you have the ```plyr``` library installed in R prior to running the ```run_analysis.R``` script.
Explanation of run_analysis.R
---
run_analysis.R does the following steps in order:
1. Merges the training and test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Step 1**, the script reads the source tables from 6 different files, then ```rbind``` & ```cbind```s them together.
**Step 2**, the script reads the features, and adds it as column names to the data set. It then only extracts the columns in the data set that have the *mean, standard deviation, subject or activity id*.
**Step 3**, the script uses the ```plyr``` library to join the activity labels (after reading them) with the data set.
**Step 4**, the script goes through all the column names in the data set and makes it human readable.
**Step 5**, the script gets the means for each variable across each activity and subject. It then orders it, then writes it to disk as ```cleanedData.txt```