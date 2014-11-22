# Read in data from each of the separate .txt files.
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")
x_test <- read.table("X_test.txt")
x_train <- read.table("X_train.txt")
y_test <- read.table("y_test.txt")
y_train <- read.table("y_train.txt")

# Combine each type of data by row with its respective counterpart.
subject_dat <- rbind(subject_train, subject_test)
x_dat <- rbind(x_train, x_test)
y_dat <- rbind(y_train, y_test)

# For loop for assignning activity labels to the respective activity code on the Y data frame.
activity_labels <- read.table("activity_labels.txt")
for( i in 1:length( y_dat[, 1] ) ) {
      
      for( j in 1:length( activity_labels[, 2] ) ) {
            
            if( y_dat[i, 1] == activity_labels[j, 1] ) {
                  
                  y_dat[i, 1] <- as.character(activity_labels[j, 2])                  
            }           
      }  
}

# Read in features .txt file and assign column names to each of type of data that was binded by row in the previous steps.
features <- read.table("features.txt")
features <- features[, 2]
features <- as.character(features)
colnames(x_dat) <- features
colnames(subject_dat) <- "Subject"
colnames(y_dat) <- "Activity"

# Subset the measurements in X by column names which include "mean" or "std" to subset variables which are measures of the mean and standard deviation, respectively.
mean_std_dat <- x_dat[, which(grepl("mean", colnames(x_dat), ignore.case=TRUE) | grepl("std", colnames(x_dat), ignore.case=TRUE) ) ]

# Merge each data frame to create a merged data frame, convert to a data table then apply the lapply function to calculate the mean of each measure grouped by the Subject and Activity labels to create the final tidy data set.
merged_dat <- cbind(mean_std_dat, subject_dat, y_dat)
merged_dat <- data.table(merged_dat)
variables <- head( names( merged_dat), -2 )
tidy_df <- merged_dat[, lapply(.SD, mean(x)), .SDcols=variables, by=list(Subject, Activity)]
tidy_df <- tidy_df[ order( Subject, Activity ) ]
