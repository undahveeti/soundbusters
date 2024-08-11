USE `db`;

CREATE TABLE IF NOT EXISTS `artist_rating` (
  `artist` varchar(255),
  `user` BIGINT NOT NULL,
  `rating` DECIMAL(3,1),

  PRIMARY KEY (`artist`,`user`),
  CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES user(id),
  CONSTRAINT fk_artist FOREIGN KEY (artist) REFERENCES artist(id),
)