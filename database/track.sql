USE `db`;

CREATE TABLE IF NOT EXISTS `track` (
  `id` varchar(255),
  `name` varchar(255),
  `artist` varchar(255),
  `album` varchar(255),
  `disc_number` INT,
  `duration_ms` BIGINT,
  `explicit` BOOLEAN,
  `image_url` varchar(2048),
  `release_date` varchar(255),
  `track_number` INT,
  `uri` varchar(2048),
  `popularity` SMALLINT,

  PRIMARY KEY (`id`),
  CONSTRAINT fk_album FOREIGN KEY (album) REFERENCES album(id),
  CONSTRAINT fk_artist FOREIGN KEY (artist) REFERENCES artist(id),

)