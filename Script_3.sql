-- название и продолжительность самого продолжительного трека;
SELECT title, continuity FROM "Tracks" 
WHERE continuity = (SELECT MAX(continuity) FROM "Tracks");

-- название треков, продолжительность которых не менее 3,5 минут;
SELECT title, continuity FROM "Tracks"
WHERE continuity >= '00:03:30';

-- названия сборников, вышедших в период с 2018 по 2020 год с ограничениями;
select title FROM "Albums"
WHERE "year" BETWEEN 2018 AND 2020;

-- исполнители, чье имя состоит из 1 слова;
select name FROM "Performers"
WHERE name NOT LIKE  '% %';

-- название треков, которое содержит слово "мой"/"my".
SELECT title FROM "Tracks"
	WHERE title LIKE '%мой%';
	
SELECT title FROM "Tracks" 
	WHERE title LIKE '%my%';


--Количество исполнителей в каждом жанре.
SELECT genreid, COUNT(performerid) FROM "PerformersTypesofMusic" 
GROUP BY genreid;


--Количество треков, вошедших в альбомы 2019-2020 годов
select count(title) from "Tracks"
join Albums on Tracks.albumid = Albums.albumid
where year >= '20190101' and year <= '20201231'


--Средняя продолжительность треков по каждому альбому
select title, avg(continuity) from "Tracks"
join "Albums"  on Tracks.albumid = Albums.albumid
group by title


--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT "Performers".name FROM "Performers" 
WHERE NOT performerid IN(SELECT performerid FROM "AlbumsPerformers"
JOIN "Albums" ON "AlbumsPerformers".albumid = "Album".albumid
WHERE  "Albums.year" = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT "Collections".title
FROM "Collections" 
JOIN "CollectionsTracks"  ON "Collection".collectionid = "CollectionsTracks".collectionid
JOIN "Tracks" ON "CollectionsTracks".collectionid = "Tracks".trackid 
JOIN "Albums" ON "Tracks".albumid = "Albums".albumid
JOIN "AlbumsPerformers" ON "Albums".albumid = "AlbumsPerformers".albumid
JOIN "Performers" ON "Performers".performerid = "AlbumsPerformers".performerid
WHERE "Performers".name = 'Бутырка' 
ORDER BY "Collections".title ;

