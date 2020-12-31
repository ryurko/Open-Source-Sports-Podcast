# PURPOSE: Examine the plays by episode in 2020

library(tidyverse)


# Load data ---------------------------------------------------------------

episode_data <- read_csv("data/episode_plays_2020.csv")


# Display barchart of plays -----------------------------------------------

episode_data %>%
  mutate(# Add new line spacing to episode title:
         title = str_replace(EpisodeTitle, " with ", "\nwith "),
         title = fct_reorder(title, Plays),
         # Add a Greg indicator 
         with_greg = ifelse(str_detect(EpisodeTitle, "Greg"), "Yes", "No")) %>%
  ggplot(aes(x = title, y = Plays, fill = with_greg)) +
  geom_bar(stat = "identity") +
  labs(x = "Episode", fill = "Featuring Gregory J. Matthews?") +
  ggthemes::scale_fill_colorblind() +
  theme_bw() +
  coord_flip() +
  theme(legend.position = "bottom")
  
  
  
