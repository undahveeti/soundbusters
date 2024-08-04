USE `db`;

CREATE TABLE IF NOT EXISTS `album_rating` (
  `album` varchar(255),
  `rating` DECIMAL(3,1),


  PRIMARY KEY (`album`),
  CONSTRAINT fk_album FOREIGN KEY (album) REFERENCES album(id),
)