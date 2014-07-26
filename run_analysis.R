
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

