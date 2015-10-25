library(dplyr)

# setup file paths:
data_folder = "UCI HAR Dataset/"
train_folder = paste0(data_folder, "train/")
test_folder = paste0(data_folder, "test/")

################################################################################
# x data
################################################################################
#cat features.txt | grep \\-mean\(\) | wc -l
#33
#cat features.txt | grep \\-std\(\) | wc -l
#33

# compute indices of features:
filename = "features.txt"
filename = paste0(data_folder, filename)

#N.B. stringsAsFactors=F must be added
features = read.table(filename, stringsAsFactors=F)

indices_mean = grep("-mean\\(\\)", features$V2)
indices_std = grep("-std\\(\\)", features$V2)
feature_indices = c(indices_mean, indices_std)


filename = "X_test.txt"
filename = paste0(test_folder, filename)
x_test = read.table(filename)
filtered_x_test = x_test[, feature_indices]

filename = "X_train.txt"
filename = paste0(train_folder, filename)
x_train = read.table(filename)
filtered_x_train = x_train[, feature_indices]

x_merged = rbind(filtered_x_train, filtered_x_test)

################################################################################
# y data
################################################################################
filename = "activity_labels.txt"
filename = paste0(data_folder, filename)
activity_labels = read.table(filename)
activity_labels = tbl_df(activity_labels)

filename = "y_test.txt"
filename = paste0(test_folder, filename)
y_test = read.table(filename)
y_test = tbl_df(y_test)

filename = "y_train.txt"
filename = paste0(train_folder, filename)
y_train = read.table(filename)
y_train = tbl_df(y_train)

y_merged = rbind(y_train, y_test)

# convert y vector to factors with proper levels
# taken from "activity_labels.txt":
y_merged$V1 = as.factor(y_merged$V1)
levels(y_merged$V1) = activity_labels$V2

################################################################################
# merge x and y data
################################################################################

# combine the columns of x and y:
merged = cbind(x_merged, y_merged)
#merged = tbl_df(merged)


################################################################################
# add subject id as the front column
################################################################################
# prepend the subject id column:
filename = "subject_test.txt"
filename = paste0(test_folder, filename)
subject_test = read.table(filename)

filename = "subject_train.txt"
filename = paste0(train_folder, filename)
subject_train = read.table(filename)

subject_merged = rbind(subject_train, subject_test)

merged = cbind(subject_merged, merged)

################################################################################
# rename columns of merged data
################################################################################
# most names were taken from features.txt
cnames = c("subjectId", features$V2[feature_indices], "activity")

#rename column names to make them concise and in camel case
#e.g.
#"fBodyBodyGyroMag-mean()" => "fBodyBodyGyroMagMean"
#"tBodyAcc-std()-X" => "tBodyAccStdX"
cnames = gsub("mean\\(\\)", "Mean", cnames)
cnames = gsub("std\\(\\)", "Std", cnames)
cnames = gsub("-", "", cnames)
colnames(merged) = cnames

################################################################################
# compute mean of each variable for each activity and each subject
################################################################################

merged = tbl_df(merged)
merged_grouped = group_by(merged, subjectId, activity)

# finding mean for each activity and each subject
by_act_sub = group_by(merged, subjectId, activity)
summarised = summarise_each(by_act_sub, funs(mean))

################################################################################
# output the results of the last step
################################################################################
write.table(summarised, file="summarised.txt", row.name=F)





