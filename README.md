gettingandcleaningdata_courseproject
==========================================
The following are the steps taken to product the tidy data set submitted for this project.

1. The files "subject_train.txt", "subject_test.txt", "X_train.txt", "X_test.txt", "y_train.txt", "y_test.txt" were taken from the downloaded file and moved to a folder where they could be read into R. 

2. The data was then binded by row to create one large data set for each of the subject, X, and y data sets.

3. The activity labels were then read into R and were assigned to the corresponding activity numerical label in the y data set.

4. To assign appropriate variable names to the X data set, the features.txt file was read in and used as the column names for the X data set.

5. Titles "Subject" and "Activity" were assigned to the subject and y data sets, respectively.

6. As required by the instructions the X data set was then truncated by subsetting using grepl() function to include only those measurements containing meaures of the mean and standard deviations.

7. Then the files were combined to create a merged data set named merged_dat.

8. In the final step the merged data was converted to a data table in order to prepare for transforming the data set into a tidy data set. 

9. Variable names for the measurements not including the names for the Subject and Activity variables were stored into variables. 

10. The tidy data set was created by subsetting the merged data set using the lapply function and taking the mean of the measurements by each Subject and Activity.

11. In the final step the tidy data set was ordered first by Subject then by each Activity to produce the final result.
