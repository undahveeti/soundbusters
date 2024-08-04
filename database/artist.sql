USE `db`;

CREATE TABLE IF NOT EXISTS `artist` (
  `id` varchar(255),
  `name` varchar(255),
  `followers` BIGINT,
  `image_url` varchar(2048),
  `uri` varchar(255),
  `genre` varchar(255),
  `popularity` SMALLINT,

  PRIMARY KEY (`id`),

)