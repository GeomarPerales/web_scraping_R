library(RCurl)
library(stringr)
library(plyr)

url_ftp <- "ftp://r-publi_dgh2:s0loLectur%40@ftp.senamhi.gob.pe/"
get_files <- getURL(url_ftp, dirlistonly = TRUE)
extracted_filenames <- str_split(get_files, "\r\n")[[1]]
extracted_html_filenames <-unlist(str_extract_all(extracted_filenames, ".+(.html)"))

url_ftp2 <- "ftp://r-publi_dgh2:s0loLectur%40@ftp.senamhi.gob.pe//PISCO_Pd_v1.0"
get_files2 <- getURL(url_ftp2, dirlistonly = TRUE)
extracted_filenames2 <- str_split(get_files2, "\r\n")[[1]]

url_ftp3 <- "ftp://r-publi_dgh2:s0loLectur%40@ftp.senamhi.gob.pe//PISCO_Pd_v1.0//datos"
get_files3 <- getURL(url_ftp3, dirlistonly = TRUE)
extracted_filenames3 <- str_split(get_files3, "\r\n")[[1]]
extracted_filenames3

#intente adentrarme más en las carpetas del enlace FTP pero no se puede