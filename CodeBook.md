## CODE BOOK: Getting and Cleaning Data Course Project
This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

#### Data Set
Full Description: [UCI Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones);
Download Dataset: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

#### R script: run_analysis.R
This R script does the following:

1. Downloads [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extracts data to a folder, **UCI HAR Dataset**

2. Reads data from files and assigns to variables: 

    * **features** from *features.txt* (561 rows, 2 columns)
    
    Training data set icnludes 70% of the observations:
    * **data_train_x** from *train/X_train.txt* (7352 rows, 561 columns)
    * **data_train_y** from *train/y_train.txt* (7352 rows, 1 column)
    * **data_train_subject** from *train/subject_train.txt* (7352 rows, 1 column)
    
    Test data set includes 30% of the observations:
    * **data_test_x** from from *test/X_test.txt* (2947 rows, 561 columns)
    * **data_test_y** from from *test/y_test.txt* (2947 rows, 1 column)
    * **data_test_subject** from *test/subject_test.txt* (2947 rows, 1 column)

3. Merges the training and the test sets to create one data set.
   
    Training sets are merged and stored to a variable, **data_train**, and test sets are merged and stored to a avaribale, **data_test**. Then both are merged together and stored to a variable, **HAR_data**.

4. Extracts only the measurements on the mean and standard deviation for each measurement.

    **grep** function is used to subset features or columns with "mean" and "std" labels; subset is stored in **HAR_data_2**

5. Uses descriptive activity names to name the activities in the data set

    Data for activity names **(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)** are read from the file, *activity_labels.txt* (6 rows, 2 columns), and are used to label the activity on the dataset based on the activity id.

6. Appropriately labels the data set with descriptive variable names.

    **gsub** function is used to replace abbreviated variables to descriptive names:
    * All "()" are replaced with ""
    * All "-" are replaced with "_"
    * All column names starting with "t" are replaced with "TimeDomain_"
    * All column names starting with "f" are replaced with "FrequencyDomain_"
    * All "Acc" are replaced with "Accelerometer"
    * All "Gyro" are replaced with "Gyroscope"
    * All "mean" are replaced with "Mean"
    * All "std" are replaced with "StandardDeviation"
    * All "Mag" are replaced with "Magntiude"
    * All "Freq" are replaced with "Frequency"

7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        
    **dplyr package** is loaded to use the **groupby** and **summarise** functions to take the mean of the variables for each subject and activity; and the new tidy data set is exported to a file, **HAR_TidyData.txt**(180 rows, 81 columns)