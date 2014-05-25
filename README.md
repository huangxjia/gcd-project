This repository contains the R script to perform the cleaning process of the smartphone dataset and a code book that describes the variables, the data, and any transformations or work that performed to clean up the data. The project is divided into 5 steps. 

30 volunteers(subjects) participated in the training or test activities and they are labeled as 1 to 30. 6 activities including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING are calculated. 

The process: 5 steps

Step one: Merges the training and the test sets to create one data set 
The README.txt file in the UCI HAR Dataset folder clearly states the connections of the scripts. The training and test sets are included in the 'train/X_train.txt' and 'test/X_test.txt'; training and test labels are included in 'train/y_train.txt' and 'test/y_test.txt'; volunteers information are included in 'train/subject_train.txt' and 'test/subject_test.txt'. rbind and cbind are used to merge these files to create one data set that include all the data. totalMerge represents the data set that merges the training and test sets.

Step two: Extracts only the measurements on the mean and standard deviation for each measurement. The features_info.txt file gives a clue on how to find the columns. Columns of the 'train/X_train.txt' and 'test/X_test.txt' are named as 561 features names in the ¡®features.txt¡¯. To extract the measurements on the mean and standard deviation for each measurement, function grep is used to identify 'mean' and 'std' in the column names of train and test sets. meanFreq() should be exempted from the selected features as mean of frequency has been included in features like 'fBodyAccJerk-mean()-Z', 'fBodyAccJerk-mean()-X', etc.
And then the identified measurements, training and test activities labels and subjects information are merged again with the rbind and cbind functions. totalMerge2 represents the data set that only include the measurement on the mean and standard deviation features.
totalMerge2 has the dimension of 10299 rows and 68 columns. The number of columns if matched with the (2 + 2*(8*3 + 9)) = 68. Mean and standard deviation for 33 basic variables go to 66 measurements. Subject labels and activities are included to make 68 columns.

     
Step three: Uses descriptive activity names to name the activities in the data set  
The activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) are numbered in the original test and train files. Use the activity_labels.txt file to change these numbers into their corresponding names, which clearly describe the activities.

Step four: Appropriately labels the data set with descriptive activity names.
The features names given in the 'features.txt' are not descriptive and some improvements are needed. Function gsub is used to substitute abbreviation to full length expression; function strsplit is used to reconstruct the order of expressions to make the features names more descriptive. 

Step five: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
As there are 30 subjects and 6 activities, 180 subgroups should be included in the new data set. Each subgroup is represented as a row in the new data set, with the mean of the targeted features. The final tidy data set included 35 columns (subject labels, activity names, and 33 columns that represent the mean of variables. Columns are selected by indentifying features that have ¡®mean¡¯ string. The problem is, string 'meanFreq' is also selected. meanFreq() should be exempted from the tidyData as mean of frequency has been include in features like 'fBodyAccJerk-mean()-Z', 'fBodyAccJerk-mean()-X', etc. In addition, for the variables given in the Readme.txt (listed below), 9 + 8*3 = 33 features are included. Subject labels and activities are included to make 35 columns.
In Step five, melt function is used to group variables for each subject and each activity. After then, dcast function is used to calculated the according mean value of variables. These two functions significantly simplify the process of calculating. tidyData has the dimension of 180 rows and 35 columns. Finally, function write.table is used to put the tidyData into the 'tidyData.txt' file. 
 
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
