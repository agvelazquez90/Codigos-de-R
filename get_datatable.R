library(rvest)
page <-  read_html(" URL ")

listings <- html_nodes(page, "table")
df.table <- as.data.frame(html_table(listings))
write.csv(df.table, file = "datos.csv")
