library(RCurl)
library(stringr)
library(plyr)

url_ftp <- "ftp://r-publi_dgh2:s0loLectur%40@ftp.senamhi.gob.pe/"
get_files <- getURL(url_ftp, dirlistonly = TRUE)
extracted_filenames <- str_split(get_files, "\r\n")[[1]]
extracted_html_filenames <-unlist(str_extract_all(extracted_filenames, ".+(.html)"))


