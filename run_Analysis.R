# Load Packages and get the Data
library(data.table)
library(reshape2)

setwd("~/week2/Module_3/UCI HAR Dataset")
path<-getwd()

# Load activity labels + features
activityLabels <- fread(file.path(path, "activity_labels.txt")
                        , col.names = c("classLabels", "activityName"))
features <- fread(file.path(path, "features.txt")
                  , col.names = c("index", "featureNames"))
mean_std_indexes <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[mean_std_indexes, featureNames]
measurements <- gsub('[()]', '', measurements)

# Load train datasets
train <- fread("train/X_train.txt")[, mean_std_indexes, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
trainActivities <- fread("train/y_train.txt", col.names = c("Activity"))
trainSubjects <- fread("train/subject_train.txt", col.names = c("SubjectNum"))
train <- cbind(trainSubjects, trainActivities, train)

# Load test datasets
test <- fread("test/X_test.txt")[, mean_std_indexes, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
testActivities <- fread("test/y_test.txt", col.names = c("Activity"))
testSubjects <- fread("test/subject_test.txt", col.names = c("SubjectNum"))
test <- cbind(testSubjects, testActivities, test)

# merge datasets
AllData <- rbind(train, test)

# Convert classLabels to activityName basically. More explicit. 
AllData[["Activity"]] <- factor(AllData[, Activity]
                                 , levels = activityLabels[["classLabels"]]
                                 , labels = activityLabels[["activityName"]])

AllData[["SubjectNum"]] <- as.factor(AllData[, SubjectNum])
AllData <- reshape2::melt(data = AllData, id = c("SubjectNum", "Activity"))
AllData <- reshape2::dcast(data = AllData, SubjectNum + Activity ~ variable, fun.aggregate = mean)

write.table(AllData, "tidy.txt", row.names=FALSE)
data.table::fwrite(x = AllData, file = "tidyData.txt", quote = FALSE)