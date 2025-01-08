--Имена групп/исполнителей
INSERT INTO artists (name) VALUES
('Sergei Rachmaninov'),
('Led Zeppelin'),
('Red Velvet'),
('Babymetal');

--Название жанров
INSERT INTO genres (genre_name) VALUES
('classic'),
('rock'),
('pop'),
('metal');

--Название альбомов
INSERT INTO albums (album_title, release_date) VALUES
('A Window In Time', 1998),
('Physical Graffiti', 1975),
('Bloom', 2022),
('Metal Galaxy', 2019);

--Название треков
INSERT INTO tracks (track_title, duration, album_id) VALUES
('Lilacs', 2.50, 1),
('In My Time of Dying', 11.9, 2),
('Sayonara', 3.16, 3),
('Cookie Jar', 3.35, 3),
('Wildside', 3.50, 3),
('Kagerou', 3.30, 4);


--Название коллекций
INSERT INTO collections (collection_name, release_date) VALUES
('first_collection', 2020),
('second_collection', 1980),
('third_collection', 2023),
('fourth_collection', 2022);


--Присоединение артистов к жанру
INSERT INTO artists_genres (artist_id, genre_id) VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4');

--Присоединение артистов и альбомов
INSERT INTO albums_artists (album_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


--Присоединение названия треков и сборников
INSERT INTO tracks_collections (track_id, collection_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 3),
(6, 4);