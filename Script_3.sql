-- название и продолжительность самого продолжительного трека;
SELECT TrackName, continuity FROM Tracks 
WHERE continuity = (SELECT MAX(continuity) FROM Tracks);

-- название треков, продолжительность которых не менее 3,5 минут;
SELECT TrackName, continuity FROM Tracks
WHERE continuity >= '00:03:30';

-- названия сборников, вышедших в период с 2018 по 2020 год с ограничениями;
select CollectionName, YearOfProduction FROM Collections
WHERE YearOfProduction BETWEEN 2018 AND 2020;

-- исполнители, чье имя состоит из 1 слова;
select Performername FROM Performers
WHERE PerformerName NOT LIKE  '% %';

-- название треков, которое содержит слово "мой"/"my".
SELECT TrackName FROM Tracks
WHERE STRING_to_ARRAY (LOWER(TrackName), ' ') && ARRAY['мой', 'my'];
	


--Количество исполнителей в каждом жанре.
SELECT GenreId, COUNT(PerformerId) FROM PerformersTypesofMusic
GROUP BY GenreId;


--Количество треков, вошедших в альбомы 2019-2020 годов
select count(TrackName) from Tracks
join Albums on Tracks.AlbumId = Albums.AlbumId
where YearRelease >= '1997' and YearRelease <= '1998'


--Средняя продолжительность треков по каждому альбому
select TrackName, avg(Continuity) from Tracks
join Albums  on Tracks.AlbumId = Albums.AlbumId
group by TrackName



--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT PerformerName FROM Performers 
WHERE NOT PerformerId IN(SELECT PerformerId FROM AlbumsPerformers
JOIN Albums ON AlbumsPerformers.AlbumId = Albums.AlbumId
WHERE  Albums.YearRelease = 2020);


--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT CollectionName FROM Collections 
JOIN CollectionsTracks  ON Collection.CollectionId = CollectionsTracks.CollectionId
JOIN Tracks ON CollectionsTracks.CollectionId = Tracks.TrackId 
JOIN Albums ON Tracks.AlbumId = Albums.AlbumId
JOIN AlbumsPerformers ON Albums.AlbumId = AlbumsPerformers.AlbumId
JOIN Performers ON Performers.PerformerId = AlbumsPerformers.PerformerId
WHERE Performers.PerformerName = 'Бутырка' 
ORDER BY Collections.CollectionName ;

