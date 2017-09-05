# Getting-CleaningDataFinalProject
## For Peer Grade Review

It is assumed that all required file i.e submit_train, X_train, y_train, submit_test, X_test and y_test are present in the working directory of R Studio.
The following steps are taken in the r script (run_analysis.R) to acquire and tidy the data:
1) All training data are acquired from three files.
2) another df is created x_mean_median where all values regarding mean and median is extracted from X_train dataframe. This is first 6 columns of the data frame.
3) Now, all three data frames are combined to form a combined data frame that contains all required data from training data sets.
4) Similarly, above three steps are performed on test data sets to finalle form a data frame called combined_test data frame.
5) A combined_total data frame is created that contains the combination of all data in combined and combined_test data frame.
6) Descriptive variable names are provided to the combine_total data frame.
7) Descriptive activity labels are provided in two steps:
    a) adding appropriate levels to activity label.
    b) asiigning appropriate activity labels.
8) A new data frame grouped_data is created that is formed by grouping combined_total by Activity_label and subject_Id
9) All the variable in grouped_data are then summarized by mean function and saved in the new data table summarized_data.
10) The summarized_data table is then exported to a txt file.
