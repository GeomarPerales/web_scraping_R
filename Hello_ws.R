library(rvest)


url_senamhi <- "https://repositorio.senamhi.gob.pe/handle/20.500.12542/1215"

data_ini <- read_html(url_senamhi)
View(data_ini)

lines <- readLines(con = url_senamhi)
View(lines)

library(RCurl)
library(stringr)

url_ftp <- "ftp://r-publi_dgh2:s0loLectur%40@ftp.senamhi.gob.pe/"
get_files <- getURL(url_ftp, dirlistonly = TRUE)
extracted_filenames <- str_split(get_files, "\r\n")[[1]]
extracted_html_filenames <-unlist(str_extract_all(extracted_filenames, ".+(.html)"))
