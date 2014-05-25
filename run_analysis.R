##step 1. Merges the training and the test sets to create one data set.

trainFold <- dir('UCI HAR Dataset/train')[-1]
testFold <- dir('UCI HAR Dataset/test')[-1]

##read data into variables
train <- lapply(as.list(trainFold), function(x) read.table(paste0(getwd(), '/UCI HAR Dataset/train/', x)))
test <- lapply(as.list(testFold), function(x) read.table(paste0(getwd(), '/UCI HAR Dataset/test/', x)))
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

##set column names with names in the 'features.txt'
colnames(train[[1]]) <- "volunteersID"
colnames(test[[1]]) <- "volunteersID"
colnames(train[[2]]) <- features[ , 2]
colnames(test[[2]]) <- features[ , 2]
colnames(train[[3]]) <- "Activities"
colnames(test[[3]]) <- "Activities"

##Firstly merge the training and test activities labels, subjects ##information and ##measurements with cbind and then merge train data ##and test data with rbind.
mergeTrain <- cbind(train[[1]], train[[3]], train[[2]])
mergeTest <- cbind(test[[1]], test[[3]], test[[2]])
totalMerge <- rbind(mergeTrain, mergeTest)


##step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##subset columns with string "mean" or "std"

meanStdIndex <- grep("mean|std", features$V2)
meanFreqIndex <- grep("meanFreq", features$V2)
meanStdIndex <- meanStdIndex[ !(meanStdIndex %in% meanFreqIndex)]
subtrain2 <- train[[2]][ , meanStdIndex]
subtest2 <- test[[2]][ , meanStdIndex]

mergeTrain2 <- cbind(train[[1]], train[[3]], subtrain2)
mergeTest2 <- cbind(test[[1]], test[[3]], subtest2)
totalMerge2 <- rbind(mergeTrain2, mergeTest2)

##Step 3. Uses descriptive activity names to name the activities in the data set

##Use the activity_labels.txt file to change these numbers into their corresponding ##names
for (i in seq_len(nrow(train[[3]]))) {
  temp <- train[[3]][i, ]
  train[[3]][i, ] <- as.character(activityLabels[activityLabels$V1 
                                                  == as.integer(temp), ]$V2)
}

for (i in seq_len(nrow(test[[3]]))) {
  temp <- test[[3]][i, ]
  test[[3]][i, ] <- as.character(activityLabels[activityLabels$V1 
                                                 == as.integer(temp), ]$V2)
}


##step 5. Creates a second, independent tidy data set with the average of each variable 
##for each activity and each subject. 
meanIndex <- grep("mean", features$V2)
meanIndex <- meanIndex[ !(meanIndex %in% meanFreqIndex)]
subtrain5 <- train[[2]][ , meanIndex]
subtest5 <- test[[2]][ , meanIndex]

mergeTrain5 <- cbind(train[[1]], train[[3]], subtrain5)
mergeTest5 <- cbind(test[[1]], test[[3]], subtest5)
totalMerge5 <- rbind(mergeTrain5, mergeTest5)

##step 4. Appropriately labels the data set with descriptive activity names. 
##replace the abbreviation expression with full length expression
s1 <- colnames(totalMerge5)
s2 <- gsub("-mean()-", "Mean", s1, fixed = TRUE)
s3 <- gsub("-mean()", "Mean", s2, fixed = TRUE)
s4 <- gsub("tBody", "TimeOFBody", s3, fixed = TRUE)
s5 <- gsub("tGravity", "TimeOFGravity", s4, fixed = TRUE)
s6 <- gsub("fBodyBody", "FrequencyOFBody", s5, fixed = TRUE)
s7 <- gsub("fBody", "FrequencyOFBody", s6, fixed = TRUE)
s8 <- gsub("Acc", "Acceleration", s7, fixed = TRUE)
s9 <- gsub("Gyro", "Gyroscope", s8, fixed = TRUE)
s10 <- gsub("Mag", "Magnitude", s9, fixed = TRUE)
s13 <- s10

##Reorganize the variable names to be more descriptive.
for (i in c(3:17, 23:31))
{
  str <- strsplit(s13[i], "Mean")
  s13[i] <- paste("MeanOf", str[[1]][1] ,"Signal", str[[1]][2], sep = "")
}

for (i in c(18:22, 32:35))
{
  str <- strsplit(s13[i], "Magnitude")
  s13[i] <- paste("MeanOfMagnitudeOf", str[[1]][1], "Signal", sep = "")
}


##step 5. Creates a second, independent tidy data set with the average of each variable 
##for each activity and each subject.
aql <- melt(totalMerge5, id.vars = c("volunteersID", "Activities"))
tidyData <- dcast(aql, volunteersID + Activities ~ variable, fun.aggregate = mean)
colnames(tidyData) <- s13

##put the tidyDat into file 'tidyData.txt'
write.table(tidyData, file = "tidyData.txt", sep = " ")
print(tidyData)

