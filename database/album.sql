USE `db`;

CREATE TABLE IF NOT EXISTS `album` (
  `id` varchar(255),
  `name` varchar(255),
  `uri` varchar(2048),
  `artist` varchar(255),
  `track` varchar(255),
  `album_type` varchar(255),
  `total_tracks` INT,
  `image_url` varchar(2048),
  `release_date` varchar(255),
  `genre` varchar(255),
  `label` varchar(255),
  `popularity` SMALLINT,

  PRIMARY KEY (`id`),
  CONSTRAINT fk_artist FOREIGN KEY (artist) REFERENCES artist(id),
  CONSTRAINT fk_track FOREIGN KEY (track) REFERENCES track(id),
)