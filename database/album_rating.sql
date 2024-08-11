USE `db`;

CREATE TABLE IF NOT EXISTS `album_rating` (
  `album` varchar(255),
  `user` BIGINT NOT NULL,
  `rating` DECIMAL(3,1),

  PRIMARY KEY (`album`,`user`),
  CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES user(id),
  CONSTRAINT fk_album FOREIGN KEY (album) REFERENCES album(id),
)