SET DEFINE OFF;

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE TOP_SONG_2024 CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE TOP_SONG_2023 CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE TOP_SONG_2022 CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Song CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

PURGE RECYCLEBIN;


CREATE TABLE Song (
    track_name VARCHAR2(300) NOT NULL,
    artist_names VARCHAR2(500) NOT NULL,
    PRIMARY KEY (track_name, artist_names)
);
/
CREATE TABLE TOP_SONG_2022 (
    song_id NUMBER PRIMARY KEY,
    track_name VARCHAR2(300) NOT NULL,
    artist_names VARCHAR2(500) NOT NULL,
    uri VARCHAR2(200) NOT NULL,
    peak_rank NUMBER NOT NULL,
    weeks_on_chart NUMBER NOT NULL,
    danceability NUMBER NOT NULL,
    energy NUMBER NOT NULL,
    music_keykey VARCHAR2(20) NOT NULL,
    loudness NUMBER NOT NULL,
    mode VARCHAR2(20) NOT NULL,
    speechiness NUMBER NOT NULL,
    acousticness NUMBER NOT NULL,
    tempo NUMBER NOT NULL,
    FOREIGN KEY (track_name, artist_names) REFERENCES Song(track_name, artist_names)
);
/
CREATE TABLE TOP_SONG_2023 (
    song_id NUMBER PRIMARY KEY,
    track_name VARCHAR2(300) NOT NULL,
    artist_names VARCHAR2(500) NOT NULL,
    streams NUMBER NOT NULL,
    bpm NUMBER NOT NULL,
    music_key VARCHAR2(20),
    mode VARCHAR2(20) NOT NULL,
    danceability_pct NUMBER NOT NULL,
    valence_pct NUMBER NOT NULL,
    energy_pct NUMBER NOT NULL,
    acousticness_pct NUMBER NOT NULL,
    instrumentalness_pct NUMBER NOT NULL,
    liveness_pct NUMBER NOT NULL,
    speechiness_pct NUMBER NOT NULL,
    FOREIGN KEY (track_name, artist_names) REFERENCES Song(track_name, artist_names)
);
/
CREATE TABLE TOP_SONG_2024 (
    song_id NUMBER PRIMARY KEY,
    track_name VARCHAR2(300) NOT NULL,
    artist_names VARCHAR2(500) NOT NULL,
    spotify_streams NUMBER NOT NULL,
    isrc VARCHAR2(50) NOT NULL,
    all_time_rank NUMBER,
    track_score NUMBER NOT NULL,
    FOREIGN KEY (track_name, artist_names) REFERENCES Song(track_name, artist_names)
);
/