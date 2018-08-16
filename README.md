# Doorbusters R Unit Testing Demo #
This demo contains code and examples for being able to set up and run coded unit tests for R programs using RUnit.

## Requirements for the Doorbuster Program ##

1. Shall read two product csv files
	1. Doorbuster1.csv
	2. Doorbuster2.csv
3. Shall add two metrics to the product data
	1. Products that are doorbusters but have no price assigned
	2. Products that are doorbusters and online, but are out of stock
3. Shall write out a csv with the following:
	1. Product id
	2. No price metric
	3. Online but out of stock metric

# Files in the Demo #

## unit_testing directory ##

***0\_monolith.R***

A script that contains all of the implemented requirements for the doorbusters program.  A lot of folks write their R programs in one long monolithic script.  These types of scripts are difficult to test and maintain.  This file serves as the example of what not to do.

----------

***data\_acquisition.R***

Contains required functions for refactoring the *reading of data files* behaviors out of the *0_monolith.R* program.  Two functions are created:

1. **read.doorbuster.csv()**
	1. reads a single doorbuster file with the doorbuster file format.
	2. Takes in a single parameter for the csv name
	3. returns a data frame of the read data
4. **read.all.doorbuster.files()**
	1. reads all of the doorbuster files (doorbuster1.csv & doorbuster2.csv) using the read.doorbuster.csv() function.
	2. puts all the read data into a single data frame
	3. returns the data frame with all data

----------

***metric_calculation.R***

Contains the required functions to add a single metric column to a data frame.  For the required program, the two metrics are the doorbusters with no price metric and the doorbusters that are online but out of stock metric.  Two functions are in this file to implement the behavior:

1. **add.column.db.noprice()**
	1. takes in a data frame and appends a column called *db.no.price*
	2. returns the new dataframe with the added column
2. **add.column.db.online.outofstock()**
	1. takes in a data frame and appends a column called *db.online.outofstock*
	2. returns the new dataframe with the added column


----------


***doorbusters\_test_driver.R***

The test driver for when the automated tests are created.  No input arguments are needed for this script.

The driver will run two test suites:

1. Data Acquisition Test Suite (tests for reading data)
2. Metrics Test Suite (tests for adding metric columns)


----------

***final_script.R***

The FINAL version of the program, using the extracted functions instead of a large monolithic script.  Run the script and within the working directory, an output file called *doorbuster_metrics.csv*.

----------

## unit_testing/tests directory ##

***doorbusters\_tests\_data\_acquisition\_readcsv.R***

Contains a handful of tests that will be used to exercise the data acquisition functionality of the doorbusters program.

*test.read.doorbuster.csv_read.proper.format()*


- Happy path unit test for reading a single doorbuster csv file.  The test creates a single doorbuster csv file and then uses the `read.doorbuster.csv` function to read it and verify the results.

*test.read.all.doorbuster.files_exactly.two()*


- Unit test that calls the `read.all.doorbuster.files` function and verifies it works.  This is mostly a happy path test that generates and reads the csv files, where ONLY two files exist.

*test.read.all.doorbuster.files_three.files()*


- Unit test that calls the `read.all.doorbuster.files` function and verifies it works.  This is mostly a happy path test that generates and reads the csv files, where three files exist, even though only two files are supposed to be read.

----------

***doorbusters\_tests\_metrics\_noprice.R***

Tests for verifying the metric calculation of *doorbuster items with no price*.

*test.add.column.db.noprice_is.db.has.price()*


*test.add.column.db.noprice_is.db.no.price()*


*test.add.column.db.noprice_is.db.mixed.price()*

*test.add.column.db.noprice_not.db.mixed.price()*

- Left for you to implement and practice

----------

***doorbusters\_tests\_metrics\_online\_outofstock.R***

Contains tests for verifying the metric calculation of *doorbusters that are online but out of stock*.

*test.add.column.db.online.outofstock_is.db_mixed.online_mixed.stock()*

- Has mixed values for online and stock status.
- Tests all four combinations of online/stock for doorbuster only items

----------

# Running the Tests #

From a command line, all you have to do is run the following command line code from the *unit_testing* directory*:

	RScript doorbusters_test_driver.R

## Test Output ##
If the test is correct, you'll see the following output:

	Loading required package: methods
	Warning message:
	package 'RUnit' was built under R version 3.1.3
	
	Attaching package: 'dplyr'
	
	The following objects are masked from 'package:stats':
	
	    filter, lag
	
	The following objects are masked from 'package:base':
	
	    intersect, setdiff, setequal, union
	
	Warning message:
	package 'dplyr' was built under R version 3.1.3
	
	
	Executing test function test.read.all.doorbuster.files_exactly.two  ...  done successfully.
	
	
	
	Executing test function test.read.all.doorbuster.files_three.files  ...  done successfully.
	
	
	
	Executing test function test.read.doorbuster.csv_read.proper.format  ...  done successfully.
	
	
	
	Executing test function test.add.column.db.noprice_is.db.has.price  ...  done successfully.
	
	
	
	Executing test function test.add.column.db.noprice_is.db.mixed.price  ...  done successfully.
	
	
	
	Executing test function test.add.column.db.noprice_is.db.no.price  ...  done successfully.
	
	
	
	Executing test function test.add.column.db.noprice_not.db.mixed.price  ...  done successfully.
	
	
	
	Executing test function test.add.column.db.online.outofstock_is.db_mixed.online_mixed.stock  ... Timing stopped at: 0 0 0
	Error in checkEquals(expected.values, sut$db.online.nostock, msg = error.msg.computation.incorrect) :
	  Modes: character, logical
	target is character, current is logicaldb.online.nostock does not have the correct value.
	In addition: Warning message:
	In isValidTestSuite(testSuites) :
	  'testSuite' object is not of class 'RUnitTestSuite'.
	 done successfully.
	
	RUNIT TEST PROTOCOL -- Thu Jan 21 00:05:00 2016
	***********************************************
	Number of test functions: 8
	Number of errors: 0
	Number of failures: 1
	
	
	2 Test Suites :
	Doorbusters Data Acquisition Test Suite - 3 test functions, 0 errors, 0 failures
	Doorbusters Metric Calculations - 5 test functions, 0 errors, 1 failure
	FAILURE in test.add.column.db.online.outofstock_is.db_mixed.online_mixed.stock: Error in checkEquals(expected.values, sut$db.online.nostock, msg = error.msg.computation.incorrect) :
	  Modes: character, logical
	target is character, current is logicaldb.online.nostock does not have the correct value.
	
	
	
	Details
	***************************
	Test Suite: Doorbusters Data Acquisition Test Suite
	Test function regexp: ^test.+
	Test file regexp: ^doorbusters_tests_data_acquisition*.+\.R
	Involved directory:
	tests
	---------------------------
	Test file: tests/doorbusters_tests_data_acquisition_readcsv.R
	test.read.all.doorbuster.files_exactly.two: (6 checks) ... OK (0.03 seconds)
	test.read.all.doorbuster.files_three.files: (6 checks) ... OK (0.02 seconds)
	test.read.doorbuster.csv_read.proper.format: (4 checks) ... OK (0 seconds)
	***************************
	Test Suite: Doorbusters Metric Calculations
	Test function regexp: ^test.+
	Test file regexp: ^doorbusters_tests_metrics*.+\.R
	Involved directory:
	tests
	---------------------------
	Test file: tests/doorbusters_tests_metrics_noprice.R
	test.add.column.db.noprice_is.db.has.price: (3 checks) ... OK (0.01 seconds)
	test.add.column.db.noprice_is.db.mixed.price: (3 checks) ... OK (0 seconds)
	test.add.column.db.noprice_is.db.no.price: (3 checks) ... OK (0.02 seconds)
	test.add.column.db.noprice_not.db.mixed.price: (0 checks) ... OK (0 seconds)
	---------------------------
	Test file: tests/doorbusters_tests_metrics_online_outofstock.R
	test.add.column.db.online.outofstock_is.db_mixed.online_mixed.stock: FAILURE !! (check number 3)
	Error in checkEquals(expected.values, sut$db.online.nostock, msg = error.msg.computation.incorrect) :
	  Modes: character, logical
	target is character, current is logicaldb.online.nostock does not have the correct value.
