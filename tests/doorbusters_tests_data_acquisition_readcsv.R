doorbusters.names.in.csv <- c("id", "door buster", "in stock", "is online", "launch date", "has image",
                              "status code", "status", "Has Price", "Price")

doorbusters.names <- c("id", "door.buster", "in.stock", "is.online", "launch.date", "has.image",
                       "status.code", "status", "Has.Price", "Price")

test.read.doorbuster.csv_read.proper.format <- function()
{
  #############################################
  ##############   GIVEN   ####################
  #############################################
  test.csv <- "temp.csv"
  
  #create the test data to write to a csv#
  row.1 <- c("4", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.2 <- c("5", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  test.data <- as.data.frame(rbind(row.1, row.2))
  names(test.data) <- doorbusters.names.in.csv
  write.csv(test.data, file = test.csv, row.names = FALSE)
  
  #############################################
  ###############   WHEN   ####################
  #############################################
  #sut = system under test#
  sut <- read.doorbuster.csv(csv.name = test.csv)
  
  #############################################
  ###############   THEN   ####################
  #############################################
  checkEquals(2, nrow(sut)) # verify the number of rows
  checkTrue(setequal(row.1, as.character(sut[1,]))) # verify row 1
  checkTrue(setequal(row.2, as.character(sut[2,]))) # verify row 2
  checkTrue(setequal(doorbusters.names, names(sut))) # verify the column names
  
  #cleanup#
  file.remove(test.csv)
  rm(test.data)
  rm(sut)
}

# test that the read.all.doorbuster.files() function reads both csv files#
test.read.all.doorbuster.files_exactly.two <- function()
{
  #############################################
  ##############   GIVEN   ####################
  #############################################
  doorbusters1.csv <- "./tests/test_data/doorbuster1.csv"
  doorbusters2.csv <- "./tests/test_data/doorbuster2.csv"
  
  # CREATE THE TEST DATA #
  row.1 <- c("4", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.2 <- c("5", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.3 <- c("6", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.4 <- c("7", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  file1.data <- as.data.frame(rbind(row.1, row.2))
  file2.data <- as.data.frame(rbind(row.3, row.4))
  names(file1.data) <- doorbusters.names.in.csv
  names(file2.data) <- doorbusters.names.in.csv
  write.csv(file1.data, file=doorbusters1.csv, row.names=FALSE)
  write.csv(file2.data, file=doorbusters2.csv, row.names=FALSE)
  
  #############################################
  ###############   WHEN   ####################
  #############################################
  sut <- read.all.doorbuster.files("./tests/test_data/")
  
  #############################################
  ###############   THEN   ####################
  #############################################
  checkEquals(4, nrow(sut)) #verify the number of rows
  checkTrue(setequal(row.1, as.character(sut[1,]))) # verify row 1
  checkTrue(setequal(row.2, as.character(sut[2,]))) # verify row 2
  checkTrue(setequal(row.3, as.character(sut[3,]))) # verify row 3
  checkTrue(setequal(row.4, as.character(sut[4,]))) # verify row 4
  checkTrue(setequal(doorbusters.names, names(sut))) # verify the column names
  
  # CLEANUP #
  file.remove(doorbusters1.csv)
  file.remove(doorbusters2.csv)
  rm(file1.data)
  rm(file2.data)
  rm(sut)
}

# test that the read.all.doorbuster.files() function reads ONLY the two csv files#
test.read.all.doorbuster.files_three.files <- function()
{
  #############################################
  ##############   GIVEN   ####################
  #############################################
  doorbusters1.csv <- "./tests/test_data/doorbuster1.csv"
  doorbusters2.csv <- "./tests/test_data/doorbuster2.csv"
  doorbusters3.csv <- "./tests/test_data/doorbuster3.csv"
  
  # CREATE THE TEST DATA #
  row.1 <- c("4", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.2 <- c("5", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.3 <- c("6", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.4 <- c("7", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.5 <- c("8", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  row.6 <- c("9", "1", "1", "1", "1/1/2015", "1", "2", "In Progress", "1", "10.00")
  file1.data <- as.data.frame(rbind(row.1, row.2))
  file2.data <- as.data.frame(rbind(row.3, row.4))
  file3.data <- as.data.frame(rbind(row.5, row.6))
  names(file1.data) <- doorbusters.names.in.csv
  names(file2.data) <- doorbusters.names.in.csv
  names(file3.data) <- doorbusters.names.in.csv
  write.csv(file1.data, file=doorbusters1.csv, row.names=FALSE)
  write.csv(file2.data, file=doorbusters2.csv, row.names=FALSE)
  write.csv(file3.data, file=doorbusters3.csv, row.names=FALSE)
  
  #############################################
  ###############   WHEN   ####################
  #############################################
  sut <- read.all.doorbuster.files("./tests/test_data/")
  
  #############################################
  ###############   THEN   ####################
  #############################################
  checkEquals(4, dim(sut)[1]) #verify the number of rows
  checkTrue(setequal(row.1, as.character(sut[1,]))) # verify row 1
  checkTrue(setequal(row.2, as.character(sut[2,]))) # verify row 2
  checkTrue(setequal(row.3, as.character(sut[3,]))) # verify row 3
  checkTrue(setequal(row.4, as.character(sut[4,]))) # verify row 4
  checkTrue(setequal(doorbusters.names, names(sut))) # verify the column names
  
  # CLEANUP #
  file.remove(doorbusters1.csv)
  file.remove(doorbusters2.csv)
  file.remove(doorbusters3.csv)
  rm(file1.data)
  rm(file2.data)
  rm(file3.data)
  rm(sut)
}