---
title: "Spotify API"
author: "Mai Dang"
date: ""
output: html_document
---
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
install.packages('spotifyr')
install.packages("ggridges")

library(spotifyr)
library(tidyverse)
library(knitr)

Sys.setenv(SPOTIFY_CLIENT_ID = '333b1355d6044b42abcf1f7d65b71f4b')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '941f247793fa4560a45ed23bf371a579')

access_token <- get_spotify_access_token()

cats <- get_categories(authorization = get_spotify_access_token(), df = TRUE)
print(cats)


Hiphop_usa <- get_category('0JQ5DAqbMKFQ00XGBls6ym', country = 'US', locale = 'ES', authorization = get_spotify_access_token())
Hiphop_usa



library(spotifyr)

beatles <- get_artist_audio_features('the beatles')
beatles
beatles %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>% 
  kable()
install.packages('ggjoy')
install.packages('ggrides')
library(ggjoy)
library(ggridges)
taylorswift <- get_artist_audio_features('taylor swift')

ggplot(taylorswift, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Taylor's joy distributions", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")
