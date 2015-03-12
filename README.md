# GetCleanData

## Purpose and Overview
This repository has been created to complete the Coursera Getting and Cleaning Data course project and is posted for grading purposes only.  Please abide by the honor code and do not copy or distribute.

This project includes the following pieces:
* Tidy_data.txt:  a tidy data set as described below
* run_analysis.R: the script for performing the analysis
* CodeBook.md: a code book that describes the variables, the data, and the work performed to clean up the data
* README.md: this file describing the project and how the script works

##Source Data
This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone.  The following zip file must be downloaded and extracted into the user's working directory in order for the run_analysis.R script to work: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the dataset is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

In addition, users must have or install the plyr package in R in order to use this script.  The plyr package is available from CRAN at:
http://cran.r-project.org/web/packages/plyr/index.html

##Script Summary
Run_analysis.R performs the following activities on the raw UCI HAR dataset:

* 1. Consolidates related pieces (i.e., measurements, subject ID, and activity code) of the training and test datasets, respectively. 
* 2. Merges the consolidated training and the test sets to create one comprehensive dataset.
* 3. Applies the column headers found in the Features.txt file of the UCI HAR dataset to the correct columns in the merged dataset.
* 4. Links the appropriate activity label to each observation (row) based on the indexed activity code found in the activity_labels.txt file of the UCI HAR dataset.
* 5. Removes any measurement columns that do not include a mean or standard deviation (std) measurement from the merged dataset.
* 6. Cleans up the remaining column names to be more readable.
* 7. Creates a second, independent tidy data set with the average of each remaining mean or std variable for each activity and each subject.
* 8. Writes the tidy dataset to a new text file named "tidy_data.txt" and saves it in the user's working directory.
