USE `db`;

CREATE TABLE IF NOT EXISTS `track_rating` (
  `track` varchar(255),
  `user` BIGINT NOT NULL,
  `rating` DECIMAL(3,1),

  PRIMARY KEY (`track`,`user`),
  CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES user(id),
  CONSTRAINT fk_track FOREIGN KEY (track) REFERENCES track(id),
)