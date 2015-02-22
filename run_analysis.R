# Sid M.
#################################################################################
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#################################################################################
# Step 1 : Merges the training and test sets to create one data set
#################################################################################
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# The merge: [Features, the Subject, the Activity] over (Train & Test)
dataSet <- rbind(cbind(xTrain, cbind(subjectTrain, yTrain)), cbind(xTest, cbind(subjectTest, yTest)))

# Clean the environment!
rm(xTest); rm(yTest); rm(xTrain); rm(yTrain); rm(subjectTrain); rm(subjectTest);

#################################################################################
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#################################################################################
# To do this, we need to label the features in the dataSet created above
features <- read.table("./UCI HAR Dataset/features.txt")
features <- rbind(features, rbind(c(562, "Subject"), c(563, "ActivityId")))[, 2]
names(dataSet) <- features

# Everything that contains "-std()" or "-mean()" is a standard deviation or mean, respectively.
# (Also allow "Subject" and "Activity Id" to slip through)
dataSet <- dataSet[, grepl("-mean()|-std()|Subject|Activity", features)]

# Clean the environment!
rm(features)

#################################################################################
# Step 3. Uses descriptive activity names to name the activities in the data set
#################################################################################
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityId", "Activity"))
library("plyr")
dataSet <- join(dataSet, activityLabels, by = "ActivityId", match = "first")

# Clean the environment!
rm(activityLabels)

#################################################################################
# Step 4. Appropriately labels the data set with descriptive variable names.
#################################################################################
# Mean | Standard Deviation
names(dataSet) <- gsub('-mean\\(\\)',"-Mean",names(dataSet))
names(dataSet) <- gsub('-std\\(\\)',"-StandardDeviation",names(dataSet))
# Acceleration | AngularAcceleration | AngularVelocity | Magnitude | Frequency
names(dataSet) <- gsub('Acc',"-Acceleration",names(dataSet))
names(dataSet) <- gsub('GyroJerk',"-AngularAcceleration",names(dataSet))
names(dataSet) <- gsub('Gyro',"-AngularVelocity",names(dataSet))
names(dataSet) <- gsub('Mag',"-Magnitude",names(dataSet))
names(dataSet) <- gsub('Freq.\\(\\)',"-Frequency",names(dataSet))
# Time | Frequency Domain
names(dataSet) <- gsub('^t',"TimeDomain-",names(dataSet))
names(dataSet) <- gsub('^f',"FrequencyDomain-",names(dataSet))

#################################################################################
# Step 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
#################################################################################
# Average everything
secondDataSet <- ddply(dataSet, c("Subject", "Activity"), numcolwise(mean))
# Sort the data (easier to comprehend)
secondDataSet <- secondDataSet[with(secondDataSet, order(Subject, ActivityId)), ]
# Since reordered, the rownames will be mismatched, so remove them.
rownames(secondDataSet) <- NULL

# Write to disk!
write.table(secondDataSet, "cleanedData.txt", row.name=FALSE)