# SPOTIFY LIBRARY ####
library(spotifyr)
library(dplyr)
library(purrr)
library(knitr)
library(lubridate) # recently played tracks
library(ggplot2)
library(ggridges)
library(plotly)
library(GGally)

Sys.setenv(SPOTIFY_CLIENT_ID = "333b1355d6044b42abcf1f7d65b71f4b")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "941f247793fa4560a45ed23bf371a579")

access_token <- get_spotify_access_token()

get_artist_audio_features('the beatles')

spotifList <- get_my_recently_played(limit = 25) %>% 
  mutate(
    artist.name = map_chr(track.artists, function(x) x$name[1]),
    played_at = as_datetime(played_at)
  ) %>% 
  select(
    all_of(c("track.name", "artist.name", "track.album.name", "played_at"))
  )

