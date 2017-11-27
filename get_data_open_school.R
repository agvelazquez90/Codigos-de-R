# Data de escualas abiertas

old.data <-
  read.csv("C:/Users/angel.velazquez/Documents/escuelas_abiertas.csv")

library(rvest)
page <-  read_html(
  'http://www.de.pr.gov/51-noticias/3118-lista-actualizada-de-escuelas-abiertas-del-departamento-de-educacion'
)

listings <- html_nodes(page, css = '.item-page')
lista <-
  sapply(listings, function(x) {
    html_text(html_children(x)[8])
  })
lista <- as.data.frame(strsplit(lista, "\r\n\t\r\n\t\t"))
lista <- lista[-c(1, 2, dim(lista)[1]), ]
 
if (dim(factor(lista)[1]) - 3 != length(old.data[[2]])) {
  df = data.frame(factor(lista), levels(old.data[[2]]))
  write.csv(df, file = "escuelas_abiertas_update1.csv")
} else{
  print("No se a encrontrado ninguna actualización")
}
