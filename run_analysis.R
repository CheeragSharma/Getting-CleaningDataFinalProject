##combining training data
subject_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
##for only mean and median measurement
x_mean_median <- x_train[,c(1:6)]
##combining different text files to one
combined1 <- cbind(subject_train,y_train)
combined <- cbind(combined1,x_mean_median)
##combining test data
subject_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
##for only mean and median measurement
x_mean_median_test <- x_test[,c(1:6)]
##combining different text files to one
combined1_test <- cbind(subject_test,y_test)
combined_test <- cbind(combined1_test,x_mean_median_test)

##combining test and training data
combined_total <- rbind(combined,combined_test)

##descriptive variable names
names(combined_total) <- c("Subject_Id", "Activity_label", "tBodyAcc-mean_x_axis", "tBodyAcc-mean_y_axis", "tBodyAcc_mean_z_axis", "tBodyAcc-median_x_axis", "tBodyAcc-median_y_axis", "tBodyAcc_median_z_axis" )

##descriptive activity labels
##adding levels to activity label
levels(combined_total$Activity_label) <- c(levels(combined_total$Activity_label), "WALKING" , "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

##assigning activity labels
combined_total$Activity_label[combined_total$Activity_label == "1"] <- "WALKING"
combined_total$Activity_label[combined_total$Activity_label == "2"] <- "WALKING_UPSTAIRS"
combined_total$Activity_label[combined_total$Activity_label == "3"] <- "WALKING_DOWNSTAIRS"
combined_total$Activity_label[combined_total$Activity_label == "4"] <- "SITTING"
combined_total$Activity_label[combined_total$Activity_label == "5"] <- "STANDING"
combined_total$Activity_label[combined_total$Activity_label == "6"] <- "LAYING"

##new tidy set after grouping and summarizing
grouped_data <- combined_total %>% group_by(Activity_label, Subject_Id)
summarized_data <- grouped_data %>% summarise_each(funs(mean), 'tBodyAcc-mean_x_axis', 'tBodyAcc-mean_y_axis', 'tBodyAcc_mean_z_axis', 'tBodyAcc-median_x_axis', 'tBodyAcc-median_y_axis', 'tBodyAcc_median_z_axis' )


