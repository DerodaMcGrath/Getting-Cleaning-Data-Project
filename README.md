# Getting-Cleaning-Data-Project

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data folder 'UCI HAR Dataset' located in this repository represents all data collected from the accelerometers from the Samsung Galaxy S smartphone.

I created one R script entitled 'run_analysis.R' (also located in this repository) that does the following: 
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement. 
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive variable names. 
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
In constructing 'run_analysis.R', I used the following logic:
  - Read the required data tables into R studio and analyzed their construction.
  - Noticed no missing or redundant data so bound test and train data together using rbind and cbind.
  - Only bound relevant mean and standard deviation columns using grepl function with colnames of data set.
  - Retained original column variable names by using colnames function on data set.
  - Loaded the required library packages ('plyr' and 'dplyr') for subsequent data table manipulation.
  - Used aggregate function to calculate means across all measure variables subsetted by person then by activity.
  - Grouped resulting smaller average data set first by person then by activity and arranged in order too.
  - Changed activity values from numbers to corresponding descriptive activity names.
  - Removed first two redundant group columns created by using aggregate function earlier in process.
  - Set working directory to home to write completed TidyData to text file ('TidyData.txt') and csv file ('TidyData.csv').
    

