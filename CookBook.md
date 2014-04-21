Cook Book
========================================================
### Data
The data collected is the activity data measured from the accelerometers from the Samsung Galaxy S smartphone.
The data is divided into test data of 2947 observations and training data of 7352 observations. There are in all 561 features as described in the file 'features_info.txt'. For all the observations there are corresponding subject and activity data.
More information is available at [Human activity recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Data Organization
* features.txt - Descriptive labels of the features measured.
* activity_labels.txt - Descriptive labels of the activities numbered from 1-6.
* Test Data - Test partition of the data.
  * test/X_test.txt - Measured data of the features (described above).
  * test/y_test.txt - Measured activites corresponding to the feature data above. 
  * test/subject_test.txt - Subject identifiers corresponding to the feature data above.
* Train Data - Training partition of the data.
  * train/X_train.txt - Measured data of the features (described above).
  * train/y_train.txt - Measured activites corresponding to the feature data above.
  * train/subject_train.txt - Subject identifiers corresponding to the feature data above.
  
### Transformations
* Add meaningful column names for the 'X_test.txt' and the 'X_train.txt' using the information in the 'features.txt' in the test and the train dataframes.
* Trim the features to only include the mean and standard deviation measures.
* Combine the activity and the subject information from the 'y_train.txt'/'y_test.txt' and the 'subject_train.txt'/'subject_test.txt' into the train and the test dataframe.
* Change the activity values to their descriptive values from the 'activity_labels.txt' in both th test and the train dataframes.
* Combine both the dataframes into one dataframe.