-- create database
CREATE DATABASE musicDb;

-- navigate to musicDb
USE musicDb;

DROP TABLE tracks, tracks_albums, tracks_artists, artists;

CREATE TABLE artists (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(256) UNIQUE NOT NULL,
   career_start varchar(256)
);


CREATE TABLE albums (
     id INT AUTO_INCREMENT PRIMARY KEY,
     title VARCHAR(256) NOT NULL UNIQUE ,
     release_date VARCHAR(256)
);

CREATE TABLE tracks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(256) NOT NULL UNIQUE ,
    duration TIME
);

-- associate track_id with album_id for albums with multiple tracks
CREATE TABLE tracks_albums (
    track_id INT,
    album_id INT,
    PRIMARY KEY (track_id, album_id),
    foreign key (track_id) references  tracks(id),
    foreign key (album_id) references albums(id)
);

-- associate track_id with artist_id for tracks with multiple artists
CREATE TABLE tracks_artists (
   track_id INT,
   artist_id INT,
   PRIMARY KEY (track_id, artist_id),
   foreign key (track_id) references  tracks(id),
   foreign key (artist_id) references artists(id)
);

INSERT INTO artists (name, career_start)
VALUES ("Taylor Swift","2006");

INSERT INTO artists (name, career_start)
VALUES
    ("The Beatles", "1960"),
    ("Michael Jackson", "1964"),
    ("Elvis Presley", "1954"),
    ("Madonna", "1979"),
    ("Bob Dylan", "1961"),
    ("Beyoncé", "1997"),
    ("Prince", "1976"),
    ("David Bowie", "1963"),
    ("Whitney Houston", "1977"),
    ("Adele", "2006"),
    ("Queen", "1970"),
    ("Frank Sinatra", "1935"),
    ("Ella Fitzgerald", "1934"),
    ("Jay-Z", "1995"),
    ("Bob Marley", "1962");


INSERT INTO tracks (title, duration)
values
    -- The Beatles tracks
("Lucy in the Sky with Diamonds", "3:28"),
("Let It Be", "3:52"),
("Yesterday", "2:04"),

-- Michael Jackson tracks
("Billie Jean", "4:54"),
("Beat It", "4:18"),
("Smooth Criminal", "4:17"),

-- Elvis Presley tracks
("Heartbreak Hotel", "2:06"),
("Hound Dog", "2:17"),
("Love Me Tender", "2:45"),

-- Madonna tracks
("Like a Prayer", "5:41"),
("Material Girl", "3:56"),
("Vogue", "5:16"),

-- Bob Dylan tracks
("Blowin' in the Wind", "2:48"),
("The Times They Are a-Changin'", "3:15"),
("Knockin' on Heaven's Door", "2:30"),

-- Beyoncé tracks
("Crazy in Love", "3:56"),
("Halo", "4:21"),
("Single Ladies (Put a Ring on It)", "3:13"),

-- Prince tracks
("Purple Rain", "8:41"),
("When Doves Cry", "3:49"),
("Kiss", "3:46"),

-- David Bowie tracks
("Space Oddity", "5:15"),
("Heroes", "6:07"),
("Life on Mars?", "3:54"),

-- Whitney Houston tracks
("I Will Always Love You", "4:31"),
("Greatest Love of All", "4:55"),
("I Wanna Dance with Somebody", "4:51"),

-- Adele tracks
("Rolling in the Deep", "3:48"),
("Hello", "4:55"),
("Someone Like You", "4:45"),

-- Queen tracks
("Bohemian Rhapsody", "5:55"),
("We Will Rock You", "2:01"),
("Another One Bites the Dust", "3:35"),

-- Frank Sinatra tracks
("My Way", "4:35"),
("Fly Me to the Moon", "2:29"),
("New York, New York", "3:18"),

-- Ella Fitzgerald tracks
("Summertime", "4:58"),
("A-Tisket, A-Tasket", "2:22"),
("Blue Skies", "3:42"),

-- Jay-Z tracks
("Empire State of Mind", "4:37"),
("99 Problems", "3:55"),
("Hard Knock Life (Ghetto Anthem)", "3:58"),

-- Bob Marley tracks
("No Woman, No Cry", "7:08"),
("One Love", "2:50"),
("Redemption Song", "3:48");

INSERT INTO albums(title, release_date )
values ("Sgt. Pepper's Lonely Hearts Club Band", "1967"),
("Thriller", "1982"),
("Elvis Presley", "1956"),
("Like a Virgin", "1984"),
("Highway 61 Revisited", "1965"),
("Beyoncé", "2013"),
("Purple Rain", "1984"),
("The Rise and Fall of Ziggy Stardust and the Spiders from Mars", "1972"),
("Whitney Houston", "1985"),
("21", "2011"),
("A Night at the Opera", "1975"),
("Frank Sinatra (Self-titled)", "1956"),
("Ella Fitzgerald (Self-titled)", "1950"),
("Reasonable Doubt", "1996"),
("Legend", "1984");




/* -- FORSØG PÅ MYSQL HVOR TRACKS HAR ARTIST_ID OG ALBUM_ID -- */

-- create database
CREATE DATABASE musicDb;

-- navigate to musicDb
USE musicDb;

-- Create the artists table
CREATE TABLE artists (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(256) UNIQUE NOT NULL,
   career_start VARCHAR(256)
);

-- Create the albums table
CREATE TABLE albums (
     id INT AUTO_INCREMENT PRIMARY KEY,
     title VARCHAR(256) NOT NULL UNIQUE,
     release_date VARCHAR(256)
);

-- Create the tracks table with foreign keys to artists and albums
CREATE TABLE tracks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(256) NOT NULL UNIQUE,
    duration TIME,
    album_id INT,
    artist_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

-- Create the tracks_albums linking table
CREATE TABLE tracks_albums (
    track_id INT,
    album_id INT,
    PRIMARY KEY (track_id, album_id),
    FOREIGN KEY (track_id) REFERENCES tracks(id),
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- Create the tracks_artists linking table
CREATE TABLE tracks_artists (
    track_id INT,
    artist_id INT,
    PRIMARY KEY (track_id, artist_id),
    FOREIGN KEY (track_id) REFERENCES tracks(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

-- Insert data into the linking tables tracks_albums and tracks_artists
INSERT INTO tracks_albums (track_id, album_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15);

INSERT INTO tracks_artists (track_id, artist_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15);

INSERT INTO artists (name, career_start)
VALUES
    ("The Beatles", "1960"),
    ("Michael Jackson", "1964"),
    ("Elvis Presley", "1954"),
    ("Madonna", "1979"),
    ("Bob Dylan", "1961"),
    ("Beyoncé", "1997"),
    ("Prince", "1976"),
    ("David Bowie", "1963"),
    ("Whitney Houston", "1977"),
    ("Adele", "2006"),
    ("Queen", "1970"),
    ("Frank Sinatra", "1935"),
    ("Ella Fitzgerald", "1934"),
    ("Jay-Z", "1995"),
    ("Bob Marley", "1962");


-- Insert data into the albums table
INSERT INTO albums (title, release_date)
VALUES
    ("Abbey Road", "1969-09-26"),
    ("Thriller", "1982-11-30"),
    ("Elvis Presley", "1956-03-23"),
    ("Like a Virgin", "1984-11-12"),
    ("Highway 61 Revisited", "1965-08-30"),
    ("Dangerously In Love", "2003-06-22"),
    ("Purple Rain", "1984-06-25"),
    ("The Rise and Fall of Ziggy Stardust and the Spiders from Mars", "1972-06-16"),
    ("Whitney Houston", "1985-02-14"),
    ("21", "2011-01-19"),
    ("A Night at the Opera", "1975-11-21"),
    ("In the Wee Small Hours", "1955-04-25"),
    ("Ella Fitzgerald Sings the Cole Porter Song Book", "1956-03-20"),
    ("The Blueprint", "2001-09-11"),
    ("Legend", "1984-05-08");

-- Insert data into the tracks table
INSERT INTO tracks (title, duration, album_id, artist_id)
VALUES
    ("Come Together", "4:19", 1, 1),
    ("Billie Jean", "4:54", 2, 2),
    ("Heartbreak Hotel", "2:12", 3, 3),
    ("Like a Virgin", "3:47", 4, 4),
    ("Like a Rolling Stone", "6:09", 5, 5),
    ("Crazy in Love", "3:55", 6, 6),
    ("Purple Rain", "8:34", 7, 7),
    ("Starman", "4:18", 8, 8),
    ("I Will Always Love You", "4:31", 9, 9),
    ("Rolling in the Deep", "3:48", 10, 10),
    ("Bohemian Rhapsody", "5:54", 11, 11),
    ("In the Wee Small Hours of the Morning", "3:18", 12, 12),
    ("I Get a Kick Out of You", "3:06", 13, 13),
    ("Takeover", "4:27", 14, 14),
    ("No Woman, No Cry", "3:57", 15, 15);

-- Insert more tracks for "The Beatles"
INSERT INTO tracks (title, duration, album_id, artist_id)
VALUES
    ("Let It Be", "4:05", 1, 1),
    ("Hey Jude", "7:11", 1, 1),
    ("Yesterday", "2:03", 1, 1);


-- Insert more tracks for "Michael Jackson"
INSERT INTO tracks (title, duration, album_id, artist_id)
VALUES
    ("Beat It", "4:18", 2, 2),
    ("Smooth Criminal", "4:19", 2, 2),
    ("Black or White", "4:16", 2, 2);


SELECT
    t.id AS track_id,
    t.title AS track_title,
    t.duration AS track_duration,
    a.id AS artist_id,
    a.name AS artist_name,
    a.career_start AS artist_career_start,
    al.id AS album_id,
    al.title AS album_title,
    al.release_date AS album_release_date
FROM
    tracks AS t
INNER JOIN
    albums AS al ON t.album_id = al.id
INNER JOIN
    artists AS a ON t.artist_id = a.id;

