library(dplyr)

error.msg.column.not.found <- "Mutated data frame is missing db.online.nostock column."
error.msg.bad.mutation <- "Mutated data frame has incorrect dimensions."
error.msg.computation.incorrect <- "db.online.nostock does not have the correct value."

expected.column.name <- "db.online.nostock"

test.add.column.db.online.outofstock_is.db_mixed.online_mixed.stock <- function()
{
    # SET UP THE TEST DATA #
    db.data <- data.frame(id=c("1","2", "3", "4"), door.buster="1",
                          is.online = c("1", "0", "1", "0"),
                          in.stock = c("1", "1", "0", "0"))
    
    # GET THE ORIGINAL DATA DIMENSIONS #
    test.dim <- dim(db.data)
    expected.values <- c("0", "0", "1", "0")
    
    # EXECUTE THE FUNCTION BEING TESTED #
    sut <- add.column.db.online.outofstock(db.data)
    
    # VERIFY THE RESULTS #
    checkEquals(test.dim+c(0,1), dim(sut), msg=error.msg.bad.mutation) #verify the data.frame dimensions
    checkEquals(expected.column.name, colnames(sut)[ncol(sut)], msg=error.msg.column.not.found) #verify column name
    checkEquals(expected.values,
                sut$db.online.nostock,
                msg=error.msg.computation.incorrect) #verify the metric values
}