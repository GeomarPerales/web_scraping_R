library(rvest)

url_senamhi <- "https://repositorio.senamhi.gob.pe/handle/20.500.12542/1215"

data_ini <- read_html(url_senamhi)
View(data_ini)

lines <- readLines(con = url_senamhi)
View(lines)
