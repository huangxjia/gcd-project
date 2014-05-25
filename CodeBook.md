a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

Where are 561 features from?

(tBodyAcc-XYZ; tGravityAcc-XYZ; tBodyAccJerk-XYZ; tBodyGyro-XYZ; tBodyGyroJerk-XYZ; tBodyAccMag; tGravityAccMag; tBodyAccJerkMag; tBodyGyroMag; tBodyGyroJerkMag; fBodyAcc-XYZ; fBodyAccJerk-XYZ; fBodyGyro-XYZ; fBodyAccMag; fBodyAccJerkMag; fBodyGyroMag; fBodyGyroJerkMag)

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




Data



Transformations

The requirement for tidyData is to collect ¡®the average of each variable for each activity and each subject¡¯. 
The final tidyData included 35 columns (subject labels, activity names, and 33 columns that represent the mean of variables). Columns are selected by indentifying features that have ¡®mean¡¯ string. The problem is, string ¡®meanFreq¡¯ contains string ¡®mean¡¯. meanFreq() is exempted from the tidyData as mean of frequency has been include in features like ¡®fBodyAccJerk-mean()-Z¡¯, ¡®fBodyAccJerk-mean()-X¡¯, etc. So, mean of 33 basic variables are calculated and this comes to the 33 columns of tidyData. 


1.	Information about the experimental study design you used
In our genomics example, the analyst would want to know what the unit of measurement for each clinical/demographic variable is (age in years, treatment by name/dose, level of diagnosis and how heterogeneous). They would also want to know how you picked the exons you used for summarizing the genomic data (UCSC/Ensembl, etc.). They would also want to know any other information about how you did the data collection/study design. For example, are these the first 20 patients that walked into the clinic? Are they 20 highly selected patients by some characteristic like age? Are they randomized to treatments? 
A common format for this document is a Word file. There should be a section called "Study design" that has a thorough description of how you collected the data. There is a section called "Code book" that describes each variable and its units. 


TidyData Variables

[1]"volunteersID"                                          
[2] "Activities"                                            
[3] "MeanOfTimeOFBodyAccelerationSignalX"                   
[4] "MeanOfTimeOFBodyAccelerationSignalY"                   
[5] "MeanOfTimeOFBodyAccelerationSignalZ"                   
[6] "MeanOfTimeOFGravityAccelerationSignalX"                
[7] "MeanOfTimeOFGravityAccelerationSignalY"                
[8] "MeanOfTimeOFGravityAccelerationSignalZ"                
[9] "MeanOfTimeOFBodyAccelerationJerkSignalX"               
[10] "MeanOfTimeOFBodyAccelerationJerkSignalY"               
[11] "MeanOfTimeOFBodyAccelerationJerkSignalZ"               
[12] "MeanOfTimeOFBodyGyroscopeSignalX"                      
[13] "MeanOfTimeOFBodyGyroscopeSignalY"                      
[14] "MeanOfTimeOFBodyGyroscopeSignalZ"                      
[15] "MeanOfTimeOFBodyGyroscopeJerkSignalX"                  
[16] "MeanOfTimeOFBodyGyroscopeJerkSignalY"                  
[17] "MeanOfTimeOFBodyGyroscopeJerkSignalZ"                  
[18] "MeanOfMagnitudeOfTimeOFBodyAccelerationSignal"         
[19] "MeanOfMagnitudeOfTimeOFGravityAccelerationSignal"      
[20] "MeanOfMagnitudeOfTimeOFBodyAccelerationJerkSignal"     
[21] "MeanOfMagnitudeOfTimeOFBodyGyroscopeSignal"            
[22] "MeanOfMagnitudeOfTimeOFBodyGyroscopeJerkSignal"        
[23] "MeanOfFrequencyOFBodyAccelerationSignalX"              
[24] "MeanOfFrequencyOFBodyAccelerationSignalY"              
[25] "MeanOfFrequencyOFBodyAccelerationSignalZ"              
[26] "MeanOfFrequencyOFBodyAccelerationJerkSignalX"          
[27] "MeanOfFrequencyOFBodyAccelerationJerkSignalY"          
[28] "MeanOfFrequencyOFBodyAccelerationJerkSignalZ"          
[29] "MeanOfFrequencyOFBodyGyroscopeSignalX"                 
[30] "MeanOfFrequencyOFBodyGyroscopeSignalY"                 
[31] "MeanOfFrequencyOFBodyGyroscopeSignalZ"                 
[32] "MeanOfMagnitudeOfFrequencyOFBodyAccelerationSignal"    
[33] "MeanOfMagnitudeOfFrequencyOFBodyAccelerationJerkSignal"
[34] "MeanOfMagnitudeOfFrequencyOFBodyGyroscopeSignal"       
[35] "MeanOfMagnitudeOfFrequencyOFBodyGyroscopeJerkSignal"   

