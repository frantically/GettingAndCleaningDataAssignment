# README

Running run_analysis.R will perform the steps below. See CookBook.md for more information on the variables produced. In order to run successfully the required input data must be in the same directory as run_analysis.R.

* For each set of data (test and training):
    * Load the data
    * Strip out all observations that are not a mean or std deviation observation
    * Convert the "wide" column format into a "long" form for easier aggregation and manipulation
* Combines the test and training sets of data
* Aggregates the observations by subject, activity and observation, calculating the mean
* Outputs the aggregated data to meanObservations.txt
