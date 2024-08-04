USE `db`;

CREATE TABLE IF NOT EXISTS `user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
)

-- INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES (1, 'test', 'test', 'test@test.com');