library(readr)
usbc_bankruptcyfilings <- read_csv("https://indicadores.pr/dataset/f255a32b-e248-4b34-89f6-fc318bbd1e14/resource/0eebdd10-8933-4e7e-93e4-eb6f7ca3a47d/download/usbc_bankruptcyfilings.csv")
date = as.Date(usbc_bankruptcyfilings$Month, format = '%m/%d/%Y')
df = cbind(date, usbc_bankruptcyfilings)
head(df)
df = df[,-2]
str(df)

library(ggplot2)
ggplot(df, aes(x = df$date,y = df$`Ch. 11`)) + geom_line() +
  geom_point(aes(x = df$date[1], y = df$`Ch. 11`[1]), size = 3, colour = "Red", fill = "Black") + 
  geom_point(aes(x = df$date[217], y = df$`Ch. 11`[217]), size = 3, colour = "blue", fill = "Black") +
  geom_text(aes(x = df$date[35], y = 40, label = "Aqui va un texto"))
