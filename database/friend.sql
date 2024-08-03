USE `mysql`;

CREATE TABLE IF NOT EXISTS `follower` (
  `user` BIGINT NOT NULL,
  `follower` BIGINT NOT NULL,
  CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES user(id),
  CONSTRAINT fk_follower FOREIGN KEY (follower) REFERENCES user(id)
)