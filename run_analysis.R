# read training set
train_path <- file.path("UCI HAR Dataset","train")
train_fn_X <- file.path(train_path,"X_train.txt")
train_fn_Y <- file.path(train_path,"Y_train.txt")
train_fn_subject <- file.path(train_path,"subject_train.txt")

# construct training data set
train_data = read.table(train_fn_X)
train_data <- cbind(train_data, read.table(train_fn_Y))
train_data <- cbind(train_data, read.table(train_fn_subject))

# read test set
test_path <- file.path("UCI HAR Dataset","test")
test_fn_X <- file.path(test_path,"X_test.txt")
test_fn_Y <- file.path(test_path,"Y_test.txt")
test_fn_subject <- file.path(test_path,"subject_test.txt")

#construct test data set
test_data = read.table(test_fn_X)
test_data <- cbind(test_data, read.table(test_fn_Y))
test_data <- cbind(test_data, read.table(test_fn_subject))


# 1. merge the two sets
merge_data <- rbind(train_data, test_data)


# 2. Extract only the measurements on the mean and standard deviation
# + last 2 cols

feature_fn <- file.path("UCI HAR Dataset", "features.txt")
features = read.table(feature_fn)

features_selected <- features[grep("mean|std", features[,2], ignore.case = T),]

cols_selected <- c(features_selected[,1], length(merge_data) - 1, length(merge_data))
all_data <- merge_data[,cols_selected]

# 3. Uses descriptive activity names to name the activities in the data set
data_len <- length(all_data)

activity_fn <- file.path("UCI HAR Dataset", "activity_labels.txt")
activities <- read.table(activity_fn)

all_data[,data_len - 1] <- activities[all_data[, data_len - 1],2]

# 4.Appropriately labels the data set with descriptive variable names
names(all_data) <- features[cols_selected,2]
names(all_data)[data_len - 1] <- "activity"
names(all_data)[data_len] <- "subject"

# 5. A tidy data set with the average of each variable 
# for each activity and each subject

tidy_data <- aggregate(all_data[,1:(length(all_data) - 2)], 
        by = list(activity = all_data$activity, 
                  subject = all_data$subject), 
        FUN = mean)

write.table(tidy_data, "tidy.txt", row.name = FALSE)

