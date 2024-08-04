USE `db`;

CREATE TABLE IF NOT EXISTS `artist_rating` (
  `artist` varchar(255),
  `rating` DECIMAL(3,1),

  PRIMARY KEY (`artist`),
  CONSTRAINT fk_artist FOREIGN KEY (artist) REFERENCES artist(id),
)