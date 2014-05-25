Where are 561 features from?

tBodyAcc-XYZ; tGravityAcc-XYZ; tBodyAccJerk-XYZ; tBodyGyro-XYZ; tBodyGyroJerk-XYZ; tBodyAccMag; tGravityAccMag; tBodyAccJerkMag; tBodyGyroMag; tBodyGyroJerkMag; fBodyAcc-XYZ; fBodyAccJerk-XYZ; fBodyGyro-XYZ; fBodyAccMag; fBodyAccJerkMag; fBodyGyroMag; fBodyGyroJerkMag

Given the basic variables above, as '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions, 8*3+9 = 33 basic variables are included in this experiment. As 561 columns are included in both the train and test sets, 561 features are derived by applying functions such as mean(), sma(), etc. These estimate functions include:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

For example, for the time of body acceleration on the X direction(tBodyAcc-X), estimates include tBodyAcc-mean()-X, tBodyAcc-std()-X, tBodyAcc-mad()-X, tBodyAcc-max()-X, tBodyAcc-min()-X, tBodyAcc-energy()-X, tBodyAcc-energy()-X, tBodyAcc-iqr()-X, tBodyAcc-entropy()-X, etc.

So, analysis on the data should be rooted in the 33 basic elements and find the according estimates(like std or correlation) to these 33 elements to solve specific problem

Transformations

The requirement for tidyData is to collect 'the average of each variable for each activity and each subject'. As there are 30 subjects and 6 activities, 180 subgroups should be included in the new data set. Each subgroup is represented as a row in the new data set, with the mean of the targeted features. 
As the sensor signals were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap, the average of each variable can be obtained by calculating the average of the mean of these variables. In this case, melt is used to subgroup the dataset into 180 groups with activity and subject. Then, dcast is used to calculate the mean of each subgroup. 
The final tidyData included 35 columns (subject labels, activity names, and 33 columns that represent the mean of variables). Columns are selected by indentifying features that have 'mean' string (meanFreq() is exempted from the tidyData as mean of frequency has been include in features like 'fBodyAccJerk-mean()-Z', 'fBodyAccJerk-mean()-X'). So, mean of 33 basic variables are calculated and this comes to the 33 columns of tidyData. 

TidyData Variables

volunteersID                              
	volunteers' ID, range from 1 to 30

Activities                                            
	Activities types, including ALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING

MeanOfTimeOFBodyAccelerationSignalX                   
	Mean of the time of body acceleration on the X direction

MeanOfTimeOFBodyAccelerationSignalY                   
	Mean of the time of body acceleration on the Y direction

MeanOfTimeOFBodyAccelerationSignalZ           
       Mean of the time of body acceleration on the Z direction        

MeanOfTimeOFGravityAccelerationSignalX         
       Mean of the time of gravity acceleration on the X direction

MeanOfTimeOFGravityAccelerationSignalY                
       Mean of the time of gravity acceleration on the Y direction

MeanOfTimeOFGravityAccelerationSignalZ                
       Mean of the time of gravity acceleration on the Z direction

MeanOfTimeOFBodyAccelerationJerkSignalX         
       Mean of the time of body acceleration jerk on the X direction      

MeanOfTimeOFBodyAccelerationJerkSignalY           
       Mean of the time of body acceleration jerk on the Y direction      

MeanOfTimeOFBodyAccelerationJerkSignalZ             
       Mean of the time of body acceleration jerk on the Z direction      

MeanOfTimeOFBodyGyroscopeSignalX               
       Mean of the time of body gyroscope on the X direction      

MeanOfTimeOFBodyGyroscopeSignalY                      
       Mean of the time of body gyroscope on the Y direction      

MeanOfTimeOFBodyGyroscopeSignalZ           
       Mean of the time of body gyroscope on the Z direction                 

MeanOfTimeOFBodyGyroscopeJerkSignalX       
       Mean of the time of body gyroscope Jerk on the X direction                 

MeanOfTimeOFBodyGyroscopeJerkSignalY                  
       Mean of the time of body gyroscope Jerk on the Y direction                 

MeanOfTimeOFBodyGyroscopeJerkSignalZ           
       Mean of the time of body gyroscope Jerk on the Z direction                        

MeanOfMagnitudeOfTimeOFBodyAccelerationSignal   
       Mean of the magnitude of the time of body acceleration signal                 

MeanOfMagnitudeOfTimeOFGravityAccelerationSignal      
       Mean of the magnitude of the time of gravity acceleration signal                 

MeanOfMagnitudeOfTimeOFBodyAccelerationJerkSignal     
       Mean of the magnitude of the time of body acceleration jerk signal                 

MeanOfMagnitudeOfTimeOFBodyGyroscopeSignal            
       Mean of the magnitude of the time of body gyroscope signal                 

MeanOfMagnitudeOfTimeOFBodyGyroscopeJerkSignal     
       Mean of the magnitude of the time of body gyroscope jerk signal                    

MeanOfFrequencyOFBodyAccelerationSignalX              
	Mean of the frequency of body acceleration on the X direction

MeanOfFrequencyOFBodyAccelerationSignalY              
	Mean of the frequency of body acceleration on the Y direction

MeanOfFrequencyOFBodyAccelerationSignalZ            
	Mean of the frequency of body acceleration on the Z direction  

MeanOfFrequencyOFBodyAccelerationJerkSignalX        
	Mean of the frequency of body acceleration jerk on the X direction  

MeanOfFrequencyOFBodyAccelerationJerkSignalY          
	Mean of the frequency of body acceleration jerk on the Y direction  

MeanOfFrequencyOFBodyAccelerationJerkSignalZ          
	Mean of the frequency of body acceleration jerk on the Z direction  

MeanOfFrequencyOFBodyGyroscopeSignalX                
	Mean of the frequency of body gyroscope on the X direction   

MeanOfFrequencyOFBodyGyroscopeSignalY    
	Mean of the frequency of body gyroscope on the Y direction               

MeanOfFrequencyOFBodyGyroscopeSignalZ                 
	Mean of the frequency of body gyroscope on the Z direction               

MeanOfMagnitudeOfFrequencyOFBodyAccelerationSignal
	Mean of the magnitude of the frequency of body acceleration signal 

MeanOfMagnitudeOfFrequencyOFBodyAccelerationJerkSignal
	Mean of the magnitude of the frequency of body acceleration jerk signal

MeanOfMagnitudeOfFrequencyOFBodyGyroscopeSignal       
	Mean of the magnitude of the frequency of body gyroscope signal

MeanOfMagnitudeOfFrequencyOFBodyGyroscopeJerkSignal   
	Mean of the magnitude of the frequency of body gyroscope jerk signal

