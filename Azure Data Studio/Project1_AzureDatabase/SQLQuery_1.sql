select * from charts; 

select * from ISOCountryCodes; 

select * from SptfyWWDSongRanking; 

select count(song) as song_count, artist from charts 
group by artist 
order by song_count desc ;  

