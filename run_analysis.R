## The script requires that the "UCI HAR Dataset" zip file (including data from Samsung Galaxy S accelerometers) provided in the assignment instructions has been downloaded and is stored in the user's working directory.

## Load the necessary R package used in this script.
	library(plyr)

## Read in and name all datasets needed to perform the analysis.
	## Step 1: Universal data label files
		Feature_labels <- read.table("UCI HAR Dataset/features.txt")
		Activity_names<- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
	## Step 2: Training data files
		Train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
		Train_data<- read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE)
		Train_activity<- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
	## Step 3: Testing data files
		Test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
		Test_data <- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)
		Test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

## Prepare Feature column headers.
	Feature_heads <-t(Feature_labels)
	Col_heads<- Feature_heads [2,]

## Merge the training and the test sets to create one data set.
	## Step 1:  Consolidate test data
		Combo_Test<-cbind(Test_data, Test_subjects, Test_activity)
	## Step 2:  Consolidate training data
		Combo_Train<-cbind(Train_data, Train_subjects, Train_activity)
	## Step 3:  Consolidate training and test data into a single table
		Combo_All <- rbind(Combo_Test, Combo_Train)
	## Step 4:  Assign new column headers
		names(Combo_All)<-c(Col_heads,"Subject","Activity_code")

## Create a new column to assign the descriptive activity names to  the activities in the data set
	Combo_All<-merge(x = Combo_All, y = Activity_names, by.x  = "Activity_code", by.y = "V1", all.x = TRUE, sort = FALSE)
	names(Combo_All)[564]<-"Activity_type"

## Extracts columns with the mean and standard deviation for each measurement. 
	## Step 1: Identify each mean and STD column by header name	
		MeanSTD_ID <- grep(".*Mean.*|.*Std.*", names(Combo_All), ignore.case=TRUE)
	## Step 2: Add activity and subject column references to list
		Need_cols <- c(563,564,MeanSTD_ID)
	## Step 3: Create new table with only needed columns
		Combo_MeanSTD <- Combo_All[,Need_cols]

## Appropriately label the data set with descriptive variable names. 
names(Combo_MeanSTD)<-gsub("^t", "time", names(Combo_MeanSTD))
names(Combo_MeanSTD)<-gsub("^f", "frequency", names(Combo_MeanSTD))
names(Combo_MeanSTD)<-gsub("Acc", "Accelerometer", names(Combo_MeanSTD))
names(Combo_MeanSTD)<-gsub("Gyro", "Gyroscope", names(Combo_MeanSTD))
names(Combo_MeanSTD)<-gsub("Mag", "Magnitude", names(Combo_MeanSTD))
names(Combo_MeanSTD)<-gsub("BodyBody", "Body", names(Combo_MeanSTD))

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	Result <- ddply(Combo_MeanSTD, .(Subject, Activity_type), function(x) colMeans(x[,3:88]))

## Output the tidy dataset.
	write.table(Result, file = "tidy_data.txt", row.names = FALSE)
