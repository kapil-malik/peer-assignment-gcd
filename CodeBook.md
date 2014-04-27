Codebook for running analysis
===============================

This script explains how to prepare the environment and how to run the analysis on UCI HAR Dataset.

Prepare Untidy Dataset
--------------
These steps are for a linux system. Please run the following commands on shell -

* wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* mv getdata%2Fprojectfiles%2FUCI\ HAR\ Dataset.zip UCI_HAR_Dataset.zip
* unzip UCI_HAR_Dataset.zip
* mv "UCI HAR Dataset" UCI_HAR_Dataset
* cd UCI_HAR_Dataset
* sudo R

This will fetch the dataset from URL, unzip it on your local box and then open R prompt inside the directory.


Generate Tidy Dataset
----------------
These steps assume that you've cloned this Git repository on your system. After following steps to "Prepare Untidy Dataset" above, run the following commands in R prompt -

* > source("{Your Git Repository Path}/peer-assignment-gcd/run_analysis.R")
* > runUCIAnalysis("tidyDataset.txt")

This will create a new file "tidyDataset.txt" containing the required tidy dataset.


Final Tidy Dataset
===================

Columns
--------

The final tidy dataset contains following 68 columns -

1. subject
2. activityName
3. tBodyAcc_mean_X
4. tBodyAcc_mean_Y
5. tBodyAcc_mean_Z
6. tBodyAcc_std_X
7. tBodyAcc_std_Y
8. tBodyAcc_std_Z
9. tGravityAcc_mean_X
10. tGravityAcc_mean_Y
11. tGravityAcc_mean_Z
12. tGravityAcc_std_X
13. tGravityAcc_std_Y
14. tGravityAcc_std_Z
15. tBodyAccJerk_mean_X
16. tBodyAccJerk_mean_Y
17. tBodyAccJerk_mean_Z
18. tBodyAccJerk_std_X
19. tBodyAccJerk_std_Y
20. tBodyAccJerk_std_Z
21. tBodyGyro_mean_X
22. tBodyGyro_mean_Y
23. tBodyGyro_mean_Z
24. tBodyGyro_std_X
25. tBodyGyro_std_Y
26. tBodyGyro_std_Z
27. tBodyGyroJerk_mean_X
28. tBodyGyroJerk_mean_Y
29. tBodyGyroJerk_mean_Z
30. tBodyGyroJerk_std_X
31. tBodyGyroJerk_std_Y
32. tBodyGyroJerk_std_Z
33. tBodyAccMag_mean
34. tBodyAccMag_std
35. tGravityAccMag_mean
36. tGravityAccMag_std
37. tBodyAccJerkMag_mean
38. tBodyAccJerkMag_std
39. tBodyGyroMag_mean
40. tBodyGyroMag_std
41. tBodyGyroJerkMag_mean
42. tBodyGyroJerkMag_std
43. fBodyAcc_mean_X
44. fBodyAcc_mean_Y
45. fBodyAcc_mean_Z
46. fBodyAcc_std_X
47. fBodyAcc_std_Y
48. fBodyAcc_std_Z
49. fBodyAccJerk_mean_X
50. fBodyAccJerk_mean_Y
51. fBodyAccJerk_mean_Z
52. fBodyAccJerk_std_X
53. fBodyAccJerk_std_Y
54. fBodyAccJerk_std_Z
55. fBodyGyro_mean_X
56. fBodyGyro_mean_Y
57. fBodyGyro_mean_Z
58. fBodyGyro_std_X
59. fBodyGyro_std_Y
60. fBodyGyro_std_Z
61. fBodyAccMag_mean
62. fBodyAccMag_std
63. fBodyBodyAccJerkMag_mean
64. fBodyBodyAccJerkMag_std
65. fBodyBodyGyroMag_mean
66. fBodyBodyGyroMag_std
67. fBodyBodyGyroJerkMag_mean
68. fBodyBodyGyroJerkMag_std

More details
---------------

* It has 180 rows, for 30 subjects X 6 activities.
* First column is "subject", and is labelled as 1,2,3.....30
* Second column is "activity", and can take following 6 values -
  * LAYING
  * SITTING
  * STANDING
  * WALKING
  * WALKING DOWNSTAIRS
  * WALKING UPSTAIRS
* Rest of the 66 columns are the measurements on mean and standard deviation in original data (i.e. the columns in original dataset containing mean() and std()). They represent average of all values for respective subject and activity

