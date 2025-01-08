CREATE TABLE IF NOT EXISTS genres (
id SERIAL PRIMARY KEY,
name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
id SERIAL PRIMARY KEY,
name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists_genres (
artist_id INTEGER REFERENCES artists(id),
genre_id INTEGER REFERENCES genres(id),
PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS albums (
id SERIAL PRIMARY KEY,
title VARCHAR(80) NOT NULL,
release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS albums_artists (
album_id INTEGER REFERENCES albums(id),
artist_id INTEGER REFERENCES artists(id),
PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS tracks (
id SERIAL PRIMARY KEY,
title VARCHAR(80) NOT NULL,
duration INTEGER NOT NULL,
album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS collections (
id SERIAL PRIMARY KEY,
title VARCHAR(80) NOT NULL,
release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks_collections (
collection_id INTEGER REFERENCES collections(id),
track_id INTEGER REFERENCES tracks(id),
PRIMARY KEY (collection_id, track_id)
);