library(openxlsx)
dir.create("data", showWarnings = FALSE)
data <- write.xlsx(cars, "data/cars.xlsx")

library(usethis)
use_readme_rmd()
