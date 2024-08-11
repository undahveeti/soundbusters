USE `db`;

CREATE TABLE IF NOT EXISTS `album_review` (
  `id` BIGINT NOT NULL AUTO_INCREMENT, 
  `album` varchar(255),
  `user` BIGINT NOT NULL,
  `review` TEXT,
  PRIMARY KEY (`user`, `album`, `id`)

  CONSTRAINT fk_album FOREIGN KEY (album) REFERENCES album(id),
  CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES user(id),
)