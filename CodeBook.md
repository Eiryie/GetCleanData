# Run_analysis.R Codebook

## Data
This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone.  The following zip file must be downloaded and extracted into the user's working directory in order for the run_analysis.R script to work: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the dataset is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The UCI HAR dataset includes the following text files:
* README:  Descriptive information on the source study and dataset.
* features_info:  Descriptive information on each measurement variable.
* features:  Column headers for each measurement variable.
* activity_labels:  Index of activity code recorded in each observation with the related activity type (e.g., standing).
* Both the train and test datasets include the following files:
  * Inertial Signals folders:  original data records (not used in this analysis).
  * x_train/x_test: measurement variables for the subjects assigned to the training and test groups.
  * y_train/y_test: activity codes for each observation.
  * subject_train/subject_test: subject identification (ID) codes for each observation. 

## Variables
* Subject:  Identification number of the test subject.  




## Data Cleanup
Run_analysis.R performs the following manipulations to the raw UCI HAR dataset.  Refer to the README.md file for a more thorough description of all activities performed within the script.

* 1. Consolidates the measurements, subject IDs, and activity codes of the training and test datasets.
* 2. Merges the consolidated training and the test sets to create one comprehensive dataset.
* 3. Applies the column headers found in the Features.txt file of the UCI HAR dataset to the correct columns in the merged dataset.
* 4. Links the appropriate activity label to each observation (row) based on the indexed activity code found in the activity_labels.txt file of the UCI HAR dataset.
* 5. Removes any measurement columns that do not include a mean or standard deviation (std) measurement from the merged dataset and updates remaining column names to be more readable.
* 6. Calculates the average of each remaining mean or std variable for each activity and each subject.
