
CREATE TABLE IF NOT EXISTS `passports` (
  `identityId` varchar(50) NOT NULL DEFAULT '',
  `identifier` varchar(50) NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `steamname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `sex` int(1) NOT NULL DEFAULT 0,
  `registration_date` varchar(50) NOT NULL,
  `expiration_date` int(11) NOT NULL DEFAULT 0,
  `avatar_url` longtext NOT NULL,
  PRIMARY KEY (`identityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;