
#install.packages("RUnit")
library(RUnit)

# Add all the source files for the functions that will be tested
source("data_acquisition.R")
source("metric_calculation.R")
source("df_manipulations.R")

tests.directory <- "tests"

# capture any command arguments #
## I use command args to pass in passwords and other sensitive data
### so that I don't have to store them in the actual code files
### This code doesn't do any database calls, so no command args needed

## STEP 1 - DEFINE THE TEST SUITES ##

# test suite for verifying that the data acquisition script works #
test.suite.doorbusters.data.acquisition <- defineTestSuite("Doorbusters Data Acquisition Test Suite",
                                                           dirs = tests.directory,
                                                           testFileRegexp = '^doorbusters_tests_data_acquisition*.+\\.R')

# test suite for verifying the metric calculation script works #
test.suite.doorbusters.metrics <- defineTestSuite("Doorbusters Metric Calculations",
                                                  dirs = tests.directory,
                                                  testFileRegexp = '^doorbusters_tests_metrics*.+\\.R')

# test suite for dataframe manipulations #
test.suite.doorbusters.df.manipulations <- defineTestSuite("Dataframe Manipulations",
                                                           dirs = tests.directory,
                                                           testFileRegexp = "^tests_df_manipulation*.+\\R")

# define the collection of test suites #
doorbusters.test.suites <- list(test.suite.doorbusters.data.acquisition, 
                                test.suite.doorbusters.metrics, 
                                test.suite.doorbusters.df.manipulations)

# Execute the test suites #
test.results <- runTestSuite(doorbusters.test.suites, verbose = 1)

printTextProtocol(test.results)
