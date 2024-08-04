USE `db`;

CREATE TABLE IF NOT EXISTS `album_rating` (
  `id` varchar(255),
  `rating` DECIMAL(3,1),


  PRIMARY KEY (`id`),
  CONSTRAINT fk_album FOREIGN KEY (album) REFERENCES album(id),
)