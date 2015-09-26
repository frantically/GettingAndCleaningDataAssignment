#Codebook for Tidy Data

#Data Source
This data is derived from the "Human Activity Recognition Using Smartphones" dataset available at the URL below:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Input Data
The input data contains measurements for various subjects performing certain activities (e.g. WALKING). Measurements are captued from the smartphone of each subject used during these activities (e.g. tBodyAcc-std()-X). Details of each of these variables can be found in features.txt and README.txt of the original data linked above.

#Output Data
A table containing the following information is produced by running run_analysis.R:

* subject - the subject performing the activity
* activity - the activity the subject is performing
* observation - the feature measured on the smartphone
* mean - the mean value of all observations for this subject, activity and observation

Only observations for features that are either mean or standard deviation have been included in this output
