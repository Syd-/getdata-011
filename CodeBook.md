# List of total Features

We have the following features:  
mean(): Mean value.  
std(): Standard deviation.  
mad(): Median absolute deviation  
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.  
iqr(): Interquartile range.  
entropy(): Signal entropy.  
arCoeff(): Autorregresion coefficients with Burg order equal to 4.  
correlation(): correlation coefficient between two signals.  
maxInds(): index of the frequency component with largest magnitude.  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency.  
skewness(): skewness of the frequency domain signal.  
kurtosis(): kurtosis of the frequency domain signal.  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

We have different signals that we measure, which are:  
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

Each signal and feature pair forms a column. Use this guide to decipher the column names.

(t | f) = Time Domain | Frequency Domain.  
(Body | Gravity) = Human Body | Gravity.  
(Acc | Gyro | GyroJerk) = Acceleration | Angular Acceleration | Angular Velocity.  
(Mag | Freq) = Magnitude | Frequency
(X | Y | Z) = X | Y | Z Axis, respectively.

# Summary choices made

The only features that made it over to the tidy data are:
mean() & std() [mean & standard deviation]. In addition, the tidy data has each column explicitly named, so it's human readable.

We chose to average every column in the tidy data set, grouped by each activity and each subject.

The tidy data is available in ```cleanedData.txt```

# Experimental study design used

Please see ```README.txt```

# Instruction List

1. Clone this repository to a directory on your computer.  
2. Download the Raw data from this [link](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip), then unzip it to this directory. Ensure that the ```UCI HAR Dataset``` is under the directory you cloned the repository to.  
3. Ensure you have the ```plyr``` library installed in R.  
4. Execute the ```run_analysis.R``` script. (Ensure you've set the wording directory in R to the repository's directory)  
5. You will find the script creates a new file containing the tidy data at ```cleanedData.txt```.
