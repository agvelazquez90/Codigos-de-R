# Get table from internet using rvest
library(rvest)
page <-  read_html(" URL ")

listings <- html_nodes(page, "table")
df.table <- as.data.frame(html_table(listings))

#this is to write a cvs
write.csv(df.table, file = "datos.csv")
