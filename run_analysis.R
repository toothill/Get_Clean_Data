processUCIData <- function(work_dir) {
  
  ## Load the data labels
  labels <- read.table(paste(work_dir, "/UCI HAR Dataset/features.txt", sep = ""), sep = "")
  act_labels <- read.table(paste(work_dir, "/UCI HAR Dataset/activity_labels.txt", sep=""))
  colnames(act_labels) <- c("Activity_Nbr", "Activity_Label")
  
  ## TEST DATA: Read raw test data
  testdata <- read.table(paste(work_dir, "/UCI HAR Dataset/test/X_test.txt", sep = ""))
  testsubject <- read.table(paste(work_dir, "/UCI HAR Dataset/test/subject_test.txt", sep =""))
  test_act_num <- read.table(paste(work_dir, "/UCI HAR Dataset/test/y_test.txt", sep = ""))

  ## TEST DATA:  Apply meaningful column headings to subject & test data
  colnames(testdata) <- labels$V2
  colnames(testsubject) <- "Subject"
  colnames(test_act_num) <- "Activity_Nbr"
  
  ## TEST DATA:  Combine the subjects, activities, & test data 
  UCIData_test <- cbind(testsubject, test_act_num, testdata)
  
  ## TRAIN DATA: Read raw test data
  traindata <- read.table(paste(work_dir, "/UCI HAR Dataset/train/X_train.txt", sep = ""), sep = "")
  trainsubject <- read.table(paste(work_dir, "/UCI HAR Dataset/train/subject_train.txt", sep = ""))
  train_act_num <- read.table(paste(work_dir, "/UCI HAR Dataset/train/y_train.txt", sep = ""))
  
  ## TRAIN DATA:  Apply meaningful column headings to subject & test data
  colnames(traindata) <- labels$V2
  colnames(trainsubject) <- "Subject"
  colnames(train_act_num) <- "Activity_Nbr"
  
  ## TRAIN DATA:  Combine the subjects, activities, & test data 
  UCIData_train <- cbind(trainsubject, train_act_num, traindata)
  
  ## Combine the test & training data
  UCIData_no_label <- rbind(UCIData_test, UCIData_train)

  ## Merge Activity Labels
  UCIData <- merge(act_labels,UCIData_no_label, x.by="Activity_Nbr", y.by = "Activity_Nbr", all=FALSE)
  
  ## Define the required columns - standard deviation & mean (Mean, mean, std)
  rqdCols <- labels[grep("mean",labels$V2),]
  rqdCols <- rbind(rqdCols, labels[grep("Mean",labels$V2),])
  rqdCols <- rbind(rqdCols, labels[grep("std",labels$V2),])
  rqdCols_vec <- as.vector(rqdCols$V2)
  rqdCols_vec <- c("Subject", "Activity_Nbr", "Activity_Label", rqdCols_vec)

  ## Use required columns vector to parse out unnecessary columns
  UCITidyData <- UCIData[,rqdCols_vec]
  UCITidyData <- UCITidyData[order(UCITidyData$Subject, UCITidyData$Activity_Nbr), ]
  
  ## Re-shape the data to long format & apply clear column headings
  UCIMelt <- melt(UCITidyData, id = c("Subject", "Activity_Nbr", "Activity_Label"), measures.var = colnames(tidy[,4:89]) )
  colnames(UCIMelt)[4:5] <- c("Measure_Description", "Measure_Value")
  
  ## Return the mean values of each measure by Subject and Activity Nuumber
  UCISum <- ddply(UCIMelt, c("Subject", "Activity_Nbr", "Activity_Label", "Measure_Description"), summarise, Mean_Value = mean(Measure_Value))
  
}  

