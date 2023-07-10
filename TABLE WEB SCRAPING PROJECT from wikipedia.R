# WEB SCRAPING PROJECT: TABLE from wikipedia




# (1) List of apple cultivars (Wikipedia)

wiki_link <- "https://en.wikipedia.org/wiki/List_of_apple_cultivars"
wiki_page <- read_html(wiki_link)

apple_table <- wiki_page %>% html_nodes("table") %>% .[2] %>% 
  html_table(fill = TRUE) %>% .[[1]]





# (2) List of Highest Grossing Films in USA and Canada (Wikipedia)
link <- "https://en.wikipedia.org/wiki/List_of_highest-grossing_films_in_the_United_States_and_Canada"
page <- read_html(link)


allTables <- page %>% html_table(fill = TRUE) # to get all the tables

# This is the unadjusted list (Unadjusted for ticket price inflation)
unadjusted_table <- allTables[[1]]
View(unadjusted_table)

# This is the adjusted list (Adjusted for ticket-price inflation)
adjusted_table <- allTables[[2]]
View(adjusted_table)






