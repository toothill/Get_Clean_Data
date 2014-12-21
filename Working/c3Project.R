processUCIData <- function(work_dir) {
  
  ## Load the data labels
  labels <- read.table(paste(work_dir, "/UCI HAR Dataset/features.txt", sep = ""), sep = "")
  
  ## TEST DATA: Read raw test data
  testdata <- read.table(paste(work_dir, "/UCI HAR Dataset/test/X_test.txt", sep = ""))
  testsubject <- read.table(paste(work_dir, "/UCI HAR Dataset/test/subject_test.txt", sep =""))
  test_act_num <- read.table(paste(work_dir, "/UCI HAR Dataset/test/y_test.txt", sep = ""))
  
  ## TEST DATA:  Apply meaningful column headings to subject & test data
  colnames(testdata) <- labels$V2
  colnames(testsubject) <- "Subject"
  
  ## TEST DATA: Translate activity numbers to activity names
  colnames(test_act_num) <- "Activity_Nbr"
  test_act_num[,"Activity_Label"] <- NA
  test_act_num$Activity_Label[test_act_num$Activity_Nbr == 1] <- "WALKING"
  test_act_num$Activity_Label[test_act_num$Activity_Nbr == 2] <- "WALKING_UPSTAIRS"
  test_act_num$Activity_Label[test_act_num$Activity_Nbr == 3] <- "WALKING_DOWNSTAIRS"
  test_act_num$Activity_Label[test_act_num$Activity_Nbr == 4] <- "SITTING"
  test_act_num$Activity_Label[test_act_num$Activity_Nbr == 5] <- "STANDING"
  test_act_num$Activity_Label[test_act_num$Activity_Nbr == 6] <- "LAYING"
  
  ## TEST DATA:  Combine the subjects, activities, & test data 
  UCIData_test <- cbind(testsubject, test_act_num, testdata)
  
  ## TRAIN DATA: Read raw test data
  traindata <- read.table(paste(work_dir, "/UCI HAR Dataset/train/X_train.txt", sep = ""), sep = "")
  trainsubject <- read.table(paste(work_dir, "/UCI HAR Dataset/train/subject_train.txt", sep = ""))
  train_act_num <- read.table(paste(work_dir, "/UCI HAR Dataset/train/y_train.txt", sep = ""))
  
  ## TRAIN DATA:  Apply meaningful column headings to subject & test data
  colnames(traindata) <- labels$V2
  colnames(trainsubject) <- "Subject"
  
  ## TRAIN DATA: Translate activity numbers to activity names
  colnames(train_act_num) <- "Activity_Nbr"
  train_act_num[,"Activity_Label"] <- NA
  train_act_num$Activity_Label[train_act_num$Activity_Nbr == 1] <- "WALKING"
  train_act_num$Activity_Label[train_act_num$Activity_Nbr == 2] <- "WALKING_UPSTAIRS"
  train_act_num$Activity_Label[train_act_num$Activity_Nbr == 3] <- "WALKING_DOWNSTAIRS"
  train_act_num$Activity_Label[train_act_num$Activity_Nbr == 4] <- "SITTING"
  train_act_num$Activity_Label[train_act_num$Activity_Nbr == 5] <- "STANDING"
  train_act_num$Activity_Label[train_act_num$Activity_Nbr == 6] <- "LAYING"
  
  ## TRAIN DATA:  Combine the subjects, activities, & test data 
  UCIData_train <- cbind(trainsubject, train_act_num, traindata)
  
  ## Combine the test & training data
  UCIData <- rbind(UCIData_test, UCIData_train)
  
  ## Define the required columns - standard deviation & mean (Mean, mean, std)
  rqdCols <- labels[grep("mean",labels$V2),]
  rqdCols <- rbind(rqdCols, labels[grep("Mean",labels$V2),])
  rqdCols <- rbind(rqdCols, labels[grep("std",labels$V2),])
  rqdCols_vec <- as.vector(rqdCols$V2)
  rqdCols_vec <- c("Subject", "Activity_Nbr", "Activity_Label", rqdCols_vec)

  ## Use required columns vector to parse out unnecessary columns
  UCITidyData <- UCIData[,rqdCols_vec]
  
  
  ## WHY DOESN'T IT WORK?  act_num$Label[act_num$V1 == 5] <- act_nlabels[5,"V2"]

}  

