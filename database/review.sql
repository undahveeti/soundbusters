USE `db`;

CREATE TABLE IF NOT EXISTS `review` (
  `id` BIGINT NOT NULL,
  `name` varchar(255),
  `artist` varchar(255),
  PRIMARY KEY (`id`)
)