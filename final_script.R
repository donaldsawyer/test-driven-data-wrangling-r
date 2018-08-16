#install.packages("dplyr")
library(dplyr)

source("data_acquisition.R")
source("metric_calculation.R")

# read the product / doorbusters data #
doorbusters.data <- read.all.doorbuster.files(getwd())

# add the doorbusters with no price metric #
doorbusters.data <- add.column.db.noprice(doorbusters.data)

# add the doorbusters that are online but out of stock metric #
doorbusters.data <- add.column.db.online.outofstock(doorbusters.data)

# select just the id and metrics #
doorbusters.metrics <- doorbusters.data[, c("id", "db.no.price", "db.online.nostock")]

# add-on: change columns to readable names #
# Add code here to update column names to be snake case


# write the data to csv #
write.csv(doorbusters.metrics, "doorbuster_metrics.csv", row.names = FALSE)
