library(dplyr)

error.msg.column.not.found <- "Mutated data frame is missing db.no.price column."
error.msg.bad.mutation <- "Mutated data frame has incorrect dimensions."
error.msg.computation.incorrect <- "db.no.price does not have the correct value."

expected.column.name <- "db.no.price"

test.add.column.db.noprice_is.db.has.price <- function()
{
    # SET UP THE TEST DATA #
    db.data.with.price <- data.frame(id=c("1","2", "3"), door.buster="1", Price="10")
    
    # GET THE ORIGINAL DATA DIMENSIONS #
    test.dim <- dim(db.data.with.price)
    
    # EXECUTE THE FUNCTION BEING TESTED #
    sut <- add.column.db.noprice(db.data.with.price)
    
    # VERIFY THE RESULTS #
    checkEquals(test.dim+c(0,1), dim(sut), msg=error.msg.bad.mutation)
    checkEquals(expected.column.name, colnames(sut)[ncol(sut)], msg=error.msg.column.not.found)
    checkEquals(rep("0", nrow(db.data.with.price)),
                sut$db.no.price,
                msg=paste0(error.msg.computation.incorrect, "  expected vector: ", 
                           paste(rep("0", nrow(db.data.with.price)), collapse = " "),
                           "  actual vector: ", paste(sut$db.no.price, collapse = " ")))
    
}

test.add.column.db.noprice_is.db.no.price <- function()
{
    # SET UP THE TEST DATA #
    db.data.with.price <- data.frame(id=c("1","2", "3"), door.buster="1", Price="0")
    
    # GET THE ORIGINAL DATA DIMENSIONS #
    test.dim <- dim(db.data.with.price)
    
    # EXECUTE THE FUNCTION BEING TESTED #
    sut <- add.column.db.noprice(db.data.with.price)
    
    # VERIFY THE RESULTS #
    checkEquals(test.dim+c(0,1), dim(sut), msg=error.msg.bad.mutation)
    checkEquals(expected.column.name, colnames(sut)[ncol(sut)], msg=error.msg.column.not.found)
    checkEquals(rep("1", nrow(db.data.with.price)),
                sut$db.no.price,
                msg=error.msg.computation.incorrect)
}

test.add.column.db.noprice_is.db.mixed.price <- function()
{
    # SET UP THE TEST DATA #
    db.data.with.price <- data.frame(id=c("1","2", "3"), door.buster="1", Price=c("0", "10", "11"))
    
    # GET THE ORIGINAL DATA DIMENSIONS #
    test.dim <- dim(db.data.with.price)
    expected.values <- c("1", "0", "0")
    
    # EXECUTE THE FUNCTION BEING TESTED #
    sut <- add.column.db.noprice(db.data.with.price)
    
    # VERIFY THE RESULTS #
    checkEquals(test.dim+c(0,1), dim(sut), msg=error.msg.bad.mutation)
    checkEquals(expected.column.name, colnames(sut)[ncol(sut)], msg=error.msg.column.not.found)
    checkEquals(expected.values,
                sut$db.no.price,
                msg=error.msg.computation.incorrect)
}

test.add.column.db.noprice_not.db.mixed.price <- function()
{
    ## HOW ABOUT IF YOU TRY WRITING THIS ONE? #
}

