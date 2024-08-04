USE `db`;

CREATE TABLE IF NOT EXISTS `track_rating` (
  `track` varchar(255),
  `rating` DECIMAL(3,1),

  PRIMARY KEY (`track`),
  CONSTRAINT fk_track FOREIGN KEY (track) REFERENCES track(id),
)