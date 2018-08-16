#install.packages("dplyr")
library(dplyr)

doorbusters1.csv <- "doorbusters1.csv"
doorbusters1.data <- read.csv(doorbusters1.csv, stringsAsFactors = FALSE, colClasses = "character")
str(doorbusters1.data)

doorbusters2.csv = "doorbusters2.csv"
doorbusters2.data <- read.csv(doorbusters2.csv, stringsAsFactors = FALSE, colClasses = "character")
str(doorbusters2.data)

# combine the data from both files #
doorbusters.data <- rbind(doorbusters1.data, doorbusters2.data)

# add the doorbusters with no price metric #
doorbusters.data <- doorbusters.data %>% 
                                mutate(db.no.price = ifelse(door.buster == 1 & Price == 0, "1", "0"))

# add the doorbusters that are online but out of stock metric #
doorbusters.data <- doorbusters.data %>% 
                                mutate(db.online.nostock = door.buster == 1 & is.online == 1 & in.stock == 0)

# select just the id and metrics #
doorbusters.metrics <- doorbusters.data[, c("id", "db.no.price", "db.online.nostock")]

# modify column names so they are snake case
# TODO

# write the data to csv #
write.csv(doorbusters.metrics, "doorbuster_metrics.csv", row.names = FALSE)
