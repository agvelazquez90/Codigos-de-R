install.packages("RODBC")
install.packages("dplyr")
install.packages("ggplot2") 
library("RODBC")
library("dplyr")
library("ggplot2")


conn <-
  odbcDriverConnect(
    'driver={SQL Server};
    server=localhost;
    database=AdventureWorks2012;
    trusted_connection=true'
  )


data <- sqlQuery(conn, "SELECT * FROM Production.TransactionHistoryArchive;")

#using dplyr
data <- select(data, TransactionDate, ActualCost)

#Convert to data frame by variable
data <- arrange(data, TransactionDate) %>% as.data.frame



#################################################################################
#using package dplyr

library(dplyr) 
# Connection to Postgres
con <- DBI::dbConnect(RPostgreSQL::PostgreSQL(),    
                      host = "localhost",   
                      port = 5432,   
                      dbname = "postgres",   
                      user = "your_user",   
                      password = "your_password" )

# Get Table
flights_db <- tbl(con, "airline")

q1 <- tbl(con, "bank") %>%
  group_by(month_idx, year, month) %>%
  summarise(subscribe = sum(ifelse(term_deposit == "yes", 1, 0)), total = n())


#################################################################################
#MS SQL

devtools::install_github("tidyverse/dplyr")
devtools::install_github("tidyverse/dbplyr")
devtools::install_github("rstats-db/odbc")
install.packages("DBI")

library(DBI)

con <- dbConnect(odbc::odbc(),
                 Driver    = "SQL Server", 
                 Server    = "localhost",
                 Database  = "airontime",
                 UID       = 'My User ID',
                 PWD       = 'My Password',
                 Port      = 1433)

dbListTables(con)#show tables

dbListFields(con, "flights")# show fields
