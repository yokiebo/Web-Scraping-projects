
# WEB SCRAPING PROJECT: TABLE 

# 2019 San Francisco Giants Statistics

library(rvest)
library(dplyr)


link <- "https://www.baseball-reference.com/teams/SFG/2019.shtml"
dataSFG <- read_html(link)

SFG_tables <- dataSFG %>% html_table(fill = TRUE) # to see all tables

# "Team batting" table
team_batting <- SFG_tables[[1]]
View(team_batting)

# "Team Pitching" table
team_pitching <- SFG_tables[[2]]
View(team_pitching)