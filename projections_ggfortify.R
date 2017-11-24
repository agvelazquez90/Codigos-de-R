library(ggfortify)
ts_setup <- auto.arima( " values for projections ") #no commas required
d.forecast <- forecast(ts_setup, level = c(95), h = 5) 
autoplot(d.forecast)
