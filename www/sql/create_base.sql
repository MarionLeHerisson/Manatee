-- REF TABLES --
CREATE TABLE User_Type(
  id INT NOT NULL AUTO_INCREMENT,
  label VARCHAR(20) NOT NULL,

  PRIMARY KEY (id)
);

INSERT INTO User_Type(label) VALUES ('Admin'), ('User');

-- MAIN TABLES --

CREATE TABLE User(
  id INT NOT NULL AUTO_INCREMENT,
  mail VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(255) UNIQUE NOT NULL,
  picture VARCHAR(255) DEFAULT NULL,
  type INT NOT NULL DEFAULT 2,
  is_deleted INT NOT NULL DEFAULT 0,

  PRIMARY KEY (id)
);

CREATE TABLE Artist(
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  user_id INT DEFAULT 0, -- if the artist has an user account -> does the accont name become the artist name ?
  picture VARCHAR(255) DEFAULT NULL,
  bio VARCHAR(255) DEFAULT NULL,
  is_deleted INT NOT NULL DEFAULT 0,

  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Album (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  date TIMESTAMP DEFAULT NULL,
  picture VARCHAR(255) DEFAULT NULL,
  is_deleted INT NOT NULL DEFAULT 0,

  PRIMARY KEY (id)
);

CREATE TABLE Style(
  id INT AUTO_INCREMENT NOT NULL,
  name INT NOT NULL,
  is_deleted INT NOT NULL DEFAULT 0,

  PRIMARY KEY (id)
);

CREATE TABLE Title(
  id INT AUTO_INCREMENT NOT NULL,
  title VARCHAR(255) NOT NULL,
  style_id INT DEFAULT NULL,
  link VARCHAR(255) NOT NULL,	-- links to websites or to files (user side)
  uploaded_at TIMESTAMP NOT NULL DEFAULT NOW(),
  uploaded_by INT NOT NULL, -- the user who uploaded the song
  is_deleted INT NOT NULL DEFAULT 0,

  PRIMARY KEY (id),
  FOREIGN KEY (style_id)  REFERENCES Style(id),
  FOREIGN KEY (uploaded_by) REFERENCES User(id)
);

CREATE TABLE Playlist(
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  created_by INT NOT NULL,
  is_deleted INT NOT NULL DEFAULT 0,

  PRIMARY KEY (id),
  FOREIGN KEY (created_by) REFERENCES User(id)
);

-- LINKING TABLES --

CREATE TABLE Playlist_Title(
  id INT AUTO_INCREMENT NOT NULL,
  playlist_id INT NOT NULL,
  title_id INT NOT NULL,
  prev_title_id INT NOT NULL DEFAULT 0,
  next_title_id INT DEFAULT NULL,
  is_deleted INT NOT NULL DEFAULT 0,

  PRIMARY KEY (id),
  FOREIGN KEY (playlist_id)   REFERENCES Playlist(id),
  FOREIGN KEY (title_id)      REFERENCES Title(id),
  FOREIGN KEY (prev_title_id) REFERENCES Title(id),     -- WARNING if title.is_deleted = 1
  FOREIGN KEY (next_title_id) REFERENCES Title(id)
);

CREATE TABLE Artist_Album( -- May disappear later...
  id INT AUTO_INCREMENT NOT NULL,
  artist_id INT NOT NULL,
  is_main_artist INT NOT NULL DEFAULT 1,
  album_id  INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (artist_id) REFERENCES Artist(id),
  FOREIGN KEY (album_id)  REFERENCES Album(id)
);

CREATE TABLE Artist_Title (
  id INT NOT NULL AUTO_INCREMENT,
  artist_id INT NOT NULL,
  title_id INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (artist_id) REFERENCES Artist(id),
  FOREIGN KEY (title_id)  REFERENCES Title(id)
);

CREATE TABLE Album_Title (
  id INT NOT NULL AUTO_INCREMENT,
  album_id INT NOT NULL,
  title_id INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (album_id) REFERENCES Album(id),
  FOREIGN KEY (title_id) REFERENCES Title(id)
);

