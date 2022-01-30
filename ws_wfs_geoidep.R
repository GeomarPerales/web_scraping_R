library(rvest)
url_gidep_wfs <- "https://www.geoidep.gob.pe/catalogo-nacional-de-servicios-web/servicios-de-publicacion-de-objetos-wfs"
data_inn_ws <- read_html(url_gidep_wfs)
tables <- html_nodes(data_inn_ws, "table")