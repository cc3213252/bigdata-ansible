CREATE DATABASE IF NOT EXISTS ranger DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE USER 'ranger'@'localhost' IDENTIFIED BY 'Aa@123456';
CREATE USER 'ranger'@'%' IDENTIFIED BY 'Aa@123456';
GRANT ALL PRIVILEGES ON *.* TO 'ranger'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'ranger'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'ranger'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'ranger'@'%' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS druid DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE USER 'druid'@'localhost' IDENTIFIED BY 'Aa@123456';
CREATE USER 'druid'@'%' IDENTIFIED BY 'Aa@123456';
GRANT ALL PRIVILEGES ON *.* TO 'druid'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'druid'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'druid'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'druid'@'%' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS hive DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE USER 'hive'@'localhost' IDENTIFIED BY 'Aa@123456';
CREATE USER 'hive'@'%' IDENTIFIED BY 'Aa@123456';
GRANT ALL PRIVILEGES ON *.* TO 'hive'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'hive'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'hive'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'hive'@'%' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS oozie DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE USER 'oozie'@'localhost' IDENTIFIED BY 'Aa@123456';
CREATE USER 'oozie'@'%' IDENTIFIED BY 'Aa@123456';
GRANT ALL PRIVILEGES ON *.* TO 'oozie'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'oozie'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'oozie'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'oozie'@'%' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS rangerkms DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE USER 'rangerkms'@'localhost' IDENTIFIED BY 'Aa@123456';
CREATE USER 'rangerkms'@'%' IDENTIFIED BY 'Aa@123456';
GRANT ALL PRIVILEGES ON *.* TO 'rangerkms'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'rangerkms'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'rangerkms'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'rangerkms'@'%' WITH GRANT OPTION;

CREATE USER 'rangeradmin'@'localhost' IDENTIFIED BY 'Aa@123456';
CREATE USER 'rangeradmin'@'%' IDENTIFIED BY 'Aa@123456';
GRANT ALL PRIVILEGES ON *.* TO 'rangeradmin'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'rangeradmin'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'rangeradmin'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'rangeradmin'@'%' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS metronrest DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE USER 'metron'@'localhost' IDENTIFIED BY 'Aa@123456';
CREATE USER 'metron'@'%' IDENTIFIED BY 'Aa@123456';
GRANT ALL PRIVILEGES ON *.* TO 'metron'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'metron'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'metron'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'metron'@'%' WITH GRANT OPTION;

use metronrest;
create table if not exists users(username varchar(50) not null primary key, password varchar(50) not null, enabled boolean not null);
create table authorities (username varchar(50) not null, authority varchar(50) not null, constraint fk_authorities_users foreign key(username) references users(username));
create unique index ix_auth_username on authorities (username,authority);

insert into users (username, password, enabled) values ('metron', 'Aa@123456',1);
insert into authorities (username, authority) values ('metron', 'ROLE_USER');

commit;
FLUSH PRIVILEGES;