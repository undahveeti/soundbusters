USE `db`;

CREATE TABLE IF NOT EXISTS `album_review_comment` (
  `review` BIGINT NOT NULL, 
  `user` BIGINT NOT NULL,
  `comment` TEXT,
  PRIMARY KEY (`user`,`review`)

  CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES user(id),
  CONSTRAINT fk_review FOREIGN KEY (review) REFERENCES album_review(id),
)