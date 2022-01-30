library(rvest)
url_ana_wms <- "https://www.idep.gob.pe/wms/wms_ana.html"
data_inn_ws <- read_html(url_ana_wms)
tables <- html_nodes(data_inn_ws, "table")

library(XML)
library(RCurl)
library(rlist)
theurl <- getURL(url_ana_wms,.opts = list(ssl.verifypeer = FALSE) )
tables <- readHTMLTable(theurl)
tables <- list.clean(tables, fun = is.null, recursive = FALSE)
colnames(tables[[1]])

colnames(tables[[1]]) <- c("Id", "Img_referencia", "Titulo",
                           "Descripcion", "Servicio", "Escala")
tabla_wms <- tables[[1]]
View(tabla_wms)

descripcion <- as.character(tabla_wms$Descripcion)

#Agrupando links de servicios WMS

for (i in 1:length(tables[[1]])) {
  links[i] <- substr(descripcion[i], 1,
                     which(strsplit(descripcion[i], "")[[1]] == "?")-1)
}


# Leyendo WMS
library(leaflet)
leaflet() %>% addTiles() %>% setView(-10.38, -77.5, zoom = 1000) %>% addWMSTiles(links[2],
  layers = "0",
  options = WMSTileOptions(format = "image/png", transparent = TRUE),
  attribution = "") 


# WMS
# NO se puede visualizar, dado que los links no están en el formato adecuado %>% %>% 
