ts_projection <- function(data, star.date, frequency , interval, titulo){
  library(ggplot2)
  library(ggfortify)
  library(forecast)
  df.ts = ts(data ,start=star.date, frequency = frequency)
  ts.hw <- HoltWinters(df.ts, gamma = FALSE)
  projection <- forecast(ts.hw , level = c(95), h = interval) 
  autoplot( projection, main= titulo)
}

ts_projection(data, star.date, frequency , interval, titulo)
ts_projection(prom_consumo_resi_22_11$consumo_por_residencia, c(1999,07), 12, 5, "test") #sustituir. 
