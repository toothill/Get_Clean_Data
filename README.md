<BR>
Author:  RBT<BR>
Date:  December 21, 2014<BR>
Source File:  run_analytis.R<BR>
<BR>
run_analysis.R generates a tidy dataset of UCI data by executing the following steps:<BR>
<BR>
(1)  Read the following data files:<BR>
		* features.txt containing measurements<BR>
		* activity_labels.txt containing activity nums & descriptions<BR>
(2)  Read the following TEST data:<BR>
		* X_test.txt containing test data<BR>
		* subject_test.txt containing the subjects participating in study<BR>
		* y_test.txt containing the activity numbers<BR>
(3)  Processes the TEST data to include:<BR>
		* Subjects<BR>
		* Activities<BR>
		* Test Measurements<BR>
(4)  Read the following TRAIN data:<BR>
		* X_train.txt containing test data<BR>
		* subject_train.txt containing the subjects participating in study<BR>
		* y_train.txt containing the activity numbers<BR>
(5)  Processes the TRAIN data to include:<BR>
		* Subjects<BR>
		* Activities<BR>
		* Test Measurements <BR>
(6)  Combine the TEST & TRAIN datasets<BR>
(7)  Define the Activity Descriptions (by merging combined dataset + activity labels)<BR>
(8)  Refine the columns in the tidy dataset to include on Mean & Standard Deviation<BR>
(9)  Re-shape the data such that all measurement columns become rows in the final dataset<BR>
(10) Return a tidy dataset that calculates the mean of the measures for each Subject / Activity<BR>
