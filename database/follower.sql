USE `db`;

CREATE TABLE IF NOT EXISTS `follower` (
  `user` BIGINT NOT NULL,
  `follower` BIGINT NOT NULL,
  CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES user(id),
  CONSTRAINT fk_follower FOREIGN KEY (follower) REFERENCES user(id),
  CONSTRAINT uq_follower UNIQUE (user, follower),
  CONSTRAINT user_cant_follow_self CHECK (user <> follower)
)