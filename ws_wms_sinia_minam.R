library(rvest)
url_sinia_minam_wms <- "https://sinia.minam.gob.pe/servicios-wms"
sinia_minam_html <- read_html(url_sinia_minam_wms)

headers <- sinia_minam_html %>% html_nodes("h4") %>% html_text()
txt_headers <- sinia_minam_html %>% html_nodes("a") %>% html_text()
txt_headers <- data.frame(txt = txt_headers)

# se usaron dos palabras para realizar la búsqueda de los enlaces en el html
links_A <- subset(txt_headers, grepl("wms", txt))
links_A <- as.character(links_A[[1]])

links_B <- subset(txt_headers, grepl("WMS", txt))
links_B <- as.character(links_B[[1]])

# Leyendo WMS
library(leaflet)
leaflet() %>% addTiles() %>%
  setView(-10.38, -77.5, zoom = 30) %>%
  addWMSTiles(links_A[4], layers = "0",
              options = WMSTileOptions(format = "image/png", transparent = TRUE),
              attribution = "")

#la lectura del WMS depende del formato adecuado del enlace y la conexion a internet