library(plyr)

#RUN UCI ANALYSIS AND OUTPUT AS TEXT FILE
runUCIAnalysis<-function(outputFile="tidyDataSet.txt"){

#READ ACTIVITY LABELS
	activity_labels<-read.table("activity_labels.txt",sep=" ",col.names=c("activity","activityName"))

#READ FEATURES
	features<-read.table("features.txt",sep=" ")
	feature_names<-features[[2]]


#FILTER FOR IDENTIFYING FEATURES WITH mean() OR std() IN NAME
	mean_std_features_predicate<-grepl("mean\\(\\)",feature_names) | grepl("std\\(\\)",feature_names)

#GET COLUMN CLASSES FOR THE FILTER
	column_classes<-getColumnClasses(feature_names,mean_std_features_predicate)

#READ TRAINING DATASET
	X_train<-read.table("train/X_train.txt",col.names=feature_names,colClasses=column_classes)
	y_train<-read.table("train/y_train.txt",col.names="activity")
	subject_train<-read.table("train/subject_train.txt",col.names="subject")
	data_train<-cbind(subject_train,X_train,y_train)

#READ TEST DATASET
	X_test<-read.table("test/X_test.txt",col.names=feature_names,colClasses=column_classes)
	y_test<-read.table("test/y_test.txt",col.names="activity")
	subject_test<-read.table("test/subject_test.txt",col.names="subject")
	data_test<-cbind(subject_test,X_test,y_test)

#COMBINE DATASETS
	data_train_test<-rbind(data_train,data_test)

	column_count<-length(names(data_train_test))

#JOIN ON ACTIVITY LABELS
	data_train_test_activity<-join(data_train_test,activity_labels,by="activity",type="left")

	activity_id_index<-column_count

#REMOVE ACTIVITY ID COLUMN
	data_without_activity_id<-data_train_test_activity[,-activity_id_index]

	activity_index<-column_count

#RE-ORDER COLUMNS : "subject","activityName",... other metrics
	data_ordered<-data_without_activity_id[,c(1,activity_index,2:(column_count-1))]

	aggregate_col_indices<-3:column_count
	groupby_col_indices<-2:1

#AGGREGATE DATA ON SUBJECT, ACTIVITY NAME & APPLY mean FUNCTION
	data_with_means<-aggregate(data_ordered[,aggregate_col_indices],data_ordered[,groupby_col_indices],FUN=mean)

#RE-ORDER COLUMNS : "subject","activityName",... other metrics
	data_final<-data_with_means[,c(groupby_col_indices,aggregate_col_indices)]

#RENAME COLUMN NAMES TO REPLACE .s WITH _ AND REMOVE TRAILING _
	names(data_final)<-gsub("_$","",gsub("\\.+","_",names(data_final)))

#WRITE DATA TO FILE
	write.table(data_final,outputFile)
	TRUE
}


#GET COLUMN CLASSES FOR A VECTOR OF FEATURE NAMES, FILTERED BY A PREDICATE
getColumnClasses<-function(feature_names,selector_predicate){
	feature_indices<-c(1:length(feature_names))

	selected_feature_indices<-feature_indices[selector_predicate]

	not_selected_feature_indices<-feature_indices[-selected_feature_indices]

	column_classes<-character(length(feature_names))
	
# SET SELECTED FEATURE INDICES TO NUMERIC, REST TO NULL
	column_classes[selected_feature_indices]<-"numeric"
	column_classes[not_selected_feature_indices]<-"NULL"
	
	column_classes
} 
