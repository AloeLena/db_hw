CREATE TABLE IF NOT EXISTS genres(
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists(
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists_genres(
	id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL REFERENCES artists(id),
	genre_id INTEGER NOT NULL REFERENCES genres(id)
);

CREATE TABLE IF NOT EXISTS albums(
	id SERIAL PRIMARY KEY,
	album_title VARCHAR(80) NOT NULL,
	release_date INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS albums_artists(
	id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL REFERENCES artists(id),
	album_id INTEGER NOT NULL REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS tracks(
	id SERIAL PRIMARY KEY,
	track_title VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS collections(
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80) NOT NULL,
	release_date INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks_collections(
	id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES tracks(id),
	collection_id INTEGER NOT NULL REFERENCES collections(id)
);
