select * from release; 
select* from chart; 
select * from track; 
select * from artist;
--  Display all the song and how long they stay in the chart;  
select c.Track_Id, t.track_name, max(c.weeks_on_board) as total_weeks 
from chart c
join track t on t.track_id = c.track_id
group by c.track_id, t.track_name
order by [total_weeks] desc;  
 
-- 1. Exmple 1: Display all of the songs in the list with their audio_features;  
--This is for the circle visulaization that I have showed you. 
select t.track_name, af.danceability, af.energy, af.loudness, af.mode, af.speechiness, af.acousticness, af.instrumentalness, af.liveness, af.valence, af.tempo  
from audio_feature af  
join track t on t.Track_Id = af.af_track_id;  

--2 Example 2: Compare the average duration of songs over the years.  
select Year(al.release_date) as release_year, avg(af.duration_ms) as avg_duration   
from audio_feature af  
join album_info ai on ai.Track_Id = af.af_track_id
join album al on al.album_id = ai.Album_Id
group by Year(al.release_date)
ORDER by release_year;  

--3 Example 3: Compare the average loudness of songs over the years.  


SELECT
CASE
    WHEN release_year >= 1940 AND release_year <= 1949 THEN '1940s'
    WHEN release_year >= 1950 AND release_year <= 1959 THEN '1950s'
    WHEN release_year >= 1960 AND release_year <= 1969 THEN '1960s'
    WHEN release_year >= 1970 AND release_year <= 1979 THEN '1970s'
    WHEN release_year >= 1980 AND release_year <= 1989 THEN '1980s'
    WHEN release_year >= 1990 AND release_year <= 1999 THEN '1990s'
    WHEN release_year >= 2000 AND release_year <= 2009 THEN '2000s'
    WHEN release_year >= 2010 AND release_year <= 2019 THEN '2010s'
    -- Add more cases for other decades as needed
    ELSE 'Current Decade'
  END AS decade,
  release_year, loudness
FROM (SELECT af.loudness as loudness, YEAR(al.release_date) as release_year
FROM audio_feature af
join album_info ai on ai.Track_Id = af.af_track_id
join album al on al.album_id = ai.Album_Id) as sub_query
ORDER BY release_year ASC;

  

--4 Example 4: Compare the avg_stream, popularity, followers 
select ar.artist_name, ar.followers, ar.popularity, avg(s.NO_OF_STREAMS) as avg_stream 
from artist as ar  
join release r on r.Artist_Id = ar.artist_id
join SptfyWWDSongRanking as s on s.Track_Id = r.Track_Id 
GROUP by ar.artist_name, ar.followers, ar.popularity;  


--Table_1
select ar.popularity, ar.followers, ad.Danceability, ad.Energy, ad.Loudness, ad.Mode, ad.Speechiness, ad.Acousticness, ad.Instrumentalness, ad.Liveness, ad.Valence, ad.Tempo
from release r 
join artist ar on ar.artist_id = r.Artist_Id
join audio_feature ad on ad.af_track_id = r.Track_Id
ORDER by ar.popularity desc; 