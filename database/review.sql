USE `db`;

CREATE TABLE IF NOT EXISTS `review` (
  `album` varchar(255),
  `user` BIGINT NOT NULL,
  `review` TEXT,
  PRIMARY KEY (`user`, `album`)

  CONSTRAINT fk_album FOREIGN KEY (album) REFERENCES album(id),
  CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES user(id),
)