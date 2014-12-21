****************************************
* Author:  RBT
* Date:  December 21, 2014
* Source File:  run_analytis.R
****************************************

run_analysis.R generates a tidy dataset of UCI data by executing the following steps:

(1)  Read the following data files:
		* features.txt containing measurements
		* activity_labels.txt containing activity nums & descriptions
(2)  Read the following TEST data:
		* X_test.txt containing test data
		* subject_test.txt containing the subjects participating in study
		* y_test.txt containing the activity numbers
(3)  Processes the TEST data to include:
		* Subjects
		* Activities
		* Test Measurements
(4)  Read the following TRAIN data:
		* X_train.txt containing test data
		* subject_train.txt containing the subjects participating in study
		* y_train.txt containing the activity numbers
(5)  Processes the TRAIN data to include:
		* Subjects
		* Activities
		* Test Measurements 
(6)  Combine the TEST & TRAIN datasets
(7)  Define the Activity Descriptions (by merging combined dataset + activity labels)
(8)  Refine the columns in the tidy dataset to include on Mean & Standard Deviation
(9)  Re-shape the data such that all measurement columns become rows in the final dataset
(10) Return a tidy dataset that calculates the mean of the measures for each Subject / Activity
