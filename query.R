query <-  function(name) {
  require(RODBC)
  
  conn <-
    odbcDriverConnect(
      'driver={SQL Server};
      server= IP Address;
      database= DB Name;
      Uid= Username;
      Pwd=Password!;
      trusted_connection=true'
    )
  
  #from R use this form
  #query = paste("SELECT * from Table")
  
  #sql document
  path = " PAHT of the document "
  
  query <-
    paste(
      readLines(
        path
      ),
      collapse = '\n'
    )
  data <- sqlQuery(conn, paste(query))
  
  #odbcClose(conn)
  
  return(data)
}
