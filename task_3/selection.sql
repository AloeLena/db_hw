--Название и продолжительность самого длительного трека
SELECT track_title, duration FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

--Название треков, продолжительность которых менее 3.5 минут
SELECT track_title, duration FROM tracks
WHERE duration >= 3.5

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name FROM collections
WHERE release_date >= 2018 AND release_date <= 2020

--Исполнители, чьё имя состоит из одного слова
SELECT name FROM artists
WHERE NOT name LIKE '% %';

--Название треков, которые содержат слово «мой» или «my»
SELECT track_title FROM tracks
WHERE LOWER (track_title) LIKE '%мой%' OR LOWER (track_title) LIKE '%my%'

--Количество исполнителей в каждом жанре
SELECT genre_name, count(a.name) FROM genres g
LEFT JOIN artists_genres a2 ON g.id = a2.genre_id 
LEFT JOIN artists a ON a2.artist_id = a.id 
GROUP BY genre_name 
ORDER BY COUNT(a.name) DESC;

--Количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(track_title) FROM tracks t
LEFT JOIN albums a ON t.album_id = a.id
WHERE release_date >= 2019 AND release_date < 2021;

--Средняя продолжительность треков по каждому альбому 
SELECT a.album_title, AVG(duration) FROM tracks t 
LEFT JOIN albums a ON t.album_id = a.id
GROUP BY album_title 
ORDER BY AVG(duration);

--Все исполнители которые не выпустили альбомы в 2020 году
SELECT name FROM artists a 
LEFT JOIN albums_artists a2 ON a.id = a2.artist_id
LEFT JOIN albums a3 on a2.album_id = a3.id
WHERE name NOT IN (SELECT name FROM albums_artists WHERE release_date >= 2020 AND release_date < 2021);

--Названия сборников, в которых присутствует конкретный исполнитель
SELECT collection_name FROM collections c 
LEFT JOIN tracks_collections t on t.collection_id = c.id 
LEFT JOIN tracks t2 on t.track_id = t2.id 
LEFT JOIN albums a on t2.album_id = a.id 
LEFT JOIN albums_artists a2 on a.id = a2.album_id 
LEFT JOIN artists a3 on a2.artist_id = a3.id 
WHERE name LIKE 'Led Zeppelin';