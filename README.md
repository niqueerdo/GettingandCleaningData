## Getting and Cleaning Data Course Project

*This repo is for the course project on the Coursera course, **Getting and Cleaning Data.** *

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

#### Course Project Description

One of the most exciting areas in all of data science right now is wearable computing - see for example this [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

#### Data Set
This data was collected from the accelerometers from the Samsung Galaxy S smartphone: [UCI Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#### Repo Files
* README.md -- this document, briefly explaining how the repo/scripts work and how they are connected
* CodeBook.md -- a codebook on the raw data and transformations made to clean up the data
* run_analysis.R -- R script performing the analysis and creating the new tidy data set from the raw data; this script does the following:

        * Merges the training and the test sets to create one data set.
        * Extracts only the measurements on the mean and standard deviation for each measurement.
        * Uses descriptive activity names to name the activities in the data set
        * Appropriately labels the data set with descriptive variable names.
        * Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* HAR_TidyData.txt -- file containing the new tidy data set with labels

