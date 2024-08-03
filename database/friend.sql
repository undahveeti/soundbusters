USE `mysql`;

CREATE TABLE IF NOT EXISTS `friend` (
  `friendA` int(64) NOT NULL,
  `friendB` int(64) NOT NULL,
  CONSTRAINT fk_friendA FOREIGN KEY (friendA) REFERENCES user(id),
  CONSTRAINT fk_friendB FOREIGN KEY (friendB) REFERENCES user(id),
  CONSTRAINT uq_friends UNIQUE (LEAST(friendA, friendB), GREATEST(friendA, friendB))
)