library(ggfortify)
ts_setup <- auto.arima(prom_consumo_resi_22_11$consumo_por_residencia) # columna con los valores para proyectar
d.forecast <- forecast(ts_setup, level = c(95), h = 5) 
autoplot(d.forecast)
