
# WEB SCRAPING PROJECT: TABLE 

#Average cost of living by state

library(rvest)
library(dplyr)


link <- "https://www.patriotsoftware.com/blog/accounting/average-cost-living-by-state/"
page <- read_html(link)

all_tables <- page %>% html_table(fill = TRUE) # to see all the tables 

col_table <- all_tables[[1]]

