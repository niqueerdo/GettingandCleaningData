# You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Download Data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dateDownloaded <- date()
if(!file.exists("./UCI HAR Dataset.zip")){
        download.file(fileUrl, "./UCI HAR Dataset.zip", method = "curl")
        unzip("UCI HAR Dataset.zip", exdir = getwd())
}

# Read Data
features <- read.table("./UCI HAR Dataset/features.txt")
features <- as.character(features[ , 2])

data_train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
data_train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
data_train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

data_train <- data.frame(data_train_subject, data_train_y, data_train_x)
names(data_train) <- c(c("Subject", "Activity"), features)

data_test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
data_test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
data_test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

data_test <- data.frame(data_test_subject, data_test_y, data_test_x)
names(data_test) <- c(c("Subject", "Activity"), features)

# 1. Merges the training and the test sets to create one data set.

HAR_data <- rbind(data_train, data_test)

# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement.

mean_std <- grep("mean|std", features)
HAR_data_2 <- HAR_data[ , c(1, 2, mean_std + 2)]

# 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels <- as.character(activity_labels[ , 2])
HAR_data_2$Activity <- activity_labels[HAR_data_2$Activity]

# 4. Appropriately labels the data set with descriptive variable names.

label_name <- names(HAR_data_2)
label_name <- gsub("[(][)]", "", label_name)
label_name <- gsub("^t", "TimeDomain_", label_name)
label_name <- gsub("^f", "FrequencyDomain_", label_name)
label_name <- gsub("Acc", "Accelerometer", label_name)
label_name <- gsub("Gyro", "Gyroscope", label_name)
label_name <- gsub("mean", "Mean", label_name)
label_name <- gsub("std", "StandardDeviation", label_name)
label_name <- gsub("BodyBody", "Body", label_name)
label_name <- gsub("Mag", "Magnitude", label_name)
label_name <- gsub("Freq", "Frequency", label_name)
label_name <- gsub("-", "_", label_name)
names(HAR_data_2) <- label_name

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

library(dplyr)

HAR_tidydata <- HAR_data_2 %>% group_by(Subject, Activity) %>% summarise_all(funs(mean))
write.table(x = HAR_tidydata, file = "HAR_TidyData.txt", row.names = FALSE)


