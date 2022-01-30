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
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
