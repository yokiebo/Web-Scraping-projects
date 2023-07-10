
# WEB SCRAPING PROJECT 3 : Extracting IMDB's highest rating feature films

#Link: https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc&ref_=adv_prv


library(dplyr)
library(rvest)


get_cast <- function(movie_link) {
  movie_page <- read_html(movie_link)
  movie_cast <- movie_page %>% html_nodes("a.sc-bfec09a1-1.fUguci") %>% 
    html_text() %>% paste(collapse = ", ")
  
  return(movie_cast)
}

movies <- data.frame()

for(page_result in seq(from = 1, to = 1251, by = 50)) {
  link <- paste("https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc&start=", 
                page_result,"&ref_=adv_nxt", sep = "")
  page <- read_html(link)
  name <- page %>% html_nodes(".lister-item-header a") %>% html_text()
  movie_links <- page %>% html_nodes(".lister-item-header a") %>% html_attr("href") %>% 
    paste("https://www.imdb.com", ., sep = "")
  year <- page %>% html_nodes(".text-muted.unbold") %>%  html_text()
  rating <- page %>% html_nodes(".ratings-imdb-rating strong") %>%  html_text()
  synopsis <- page %>%  html_nodes(".ratings-bar+ .text-muted") %>%  html_text()
  cast <- sapply(movie_links, FUN = get_cast, USE.NAMES = FALSE)
  
  movies <- rbind(movies, data.frame(name, year, rating, synopsis, cast, stringsAsFactors = FALSE))
               
  print(paste("Page:", page_result))   
}



