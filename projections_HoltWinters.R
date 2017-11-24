ts_projection <- function(data, star.date, frequency , interval, title){
  library(ggplot2)
  library(ggfortify)
  library(forecast)
  df.ts = ts(data ,start=star.date, frequency = frequency)
  ts.hw <- HoltWinters(df.ts, gamma = FALSE)
  projection <- forecast(ts.hw , level = c(95), h = interval) 
  autoplot( projection, main= title)
}

ts_projection(data, star.date, frequency , interval, titulo)
