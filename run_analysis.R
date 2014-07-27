
# Read feature names from the feature.txt file.
features  <- read.table(file='UCI_HAR_Dataset/features.txt',
                        col.names=c('index', 'name'))

# Read the test data set, using feature names read above.
test.data <- read.table(file='UCI_HAR_Dataset/test/X_test.txt', 
                        col.names=as.vector(features$name))

# Read the training data set, using feature names read above.
train.data <- read.table(file='UCI_HAR_Dataset/train/X_train.txt', 
                         col.names=as.vector(features$name))

# Merge the test and training data sets
all.data <- rbind(test.data, train.data)

# Discard all but mean and std columns for each measure.
meanAndStdColumnNames <- grep("\\.std\\.|\\.mean\\.", colnames(all.data))
reduced.data <- all.data[meanAndStdColumnNames]

# Read the activity labels for the test data set.
test.activity.labels <- read.table(file='UCI_HAR_Dataset/test/y_test.txt', 
                                   col.names=c('activity_label'))

# Read the activity labels for the test data set.
train.activity.labels <- read.table(file='UCI_HAR_Dataset/train/y_train.txt', 
                                    col.names=c('activity_label'))

# Merge the test and training activity labels
all.activity.labels <- rbind(test.activity.labels, train.activity.labels)

# Read the activity labels -> activity names table.
activity.names <- read.table(file='UCI_HAR_Dataset/activity_labels.txt', 
                             col.names=c('activity_label', 'activity'))

# Join the labels and names in order to get named labels for whole data set
all.activity.names <- merge(x = all.activity.labels, y = activity.names,
                            sort = F)

# Merge in the activity names with our reduced data set
reduced.data <- cbind(reduced.data, all.activity.names['activity'])

# Read the subject IDs for the test data set.
test.subjects <- read.table(file='UCI_HAR_Dataset/test/subject_test.txt', 
                            col.names=c('subject'))

# Read the subject IDs for the traiing data set.
train.subjects <- read.table(file='UCI_HAR_Dataset/train/subject_train.txt', 
                             col.names=c('subject'))

# Merge the test and training subject IDs
all.subjects <- rbind(test.subjects, train.subjects)

# Merge in the subject IDs with our reduced data set
reduced.data <- cbind(reduced.data, all.subjects)

# Aggregate using mean, grouping across the combination of factors 'subject'
# and 'activity' to obtain final tidy data set.
tidy.data <- aggregate(. ~ subject + activity, data = reduced.data, FUN = mean)

# Write results to a CSV file.
write.csv(tidy.data, file = "tidy_data.csv", row.names = FALSE)
