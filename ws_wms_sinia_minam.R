library(rvest)
url_sinia_minam_wms <- "https://sinia.minam.gob.pe/servicios-wms"
sinia_minam_html <- read_html(url_sinia_minam_wms)

headers <- sinia_minam_html %>% html_nodes("h4") %>% html_text()
txt_headers <- sinia_minam_html %>% html_nodes("a") %>% html_text()
txt_headers <- data.frame(txt = txt_headers)

links <- subset(txt_headers, grepl("http", txt))
