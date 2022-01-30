library(rvest)
url_gidep_wfs <- "https://www.geoidep.gob.pe/catalogo-nacional-de-servicios-web/servicios-de-publicacion-de-objetos-wfs"
data_inn_ws <- read_html(url_gidep_wfs)
headers <- data_inn_ws %>% html_nodes("option") %>% html_text()

#la función rvest no lee el enlace del geoidep - 
#catalogo nacional de servicios web de Perú