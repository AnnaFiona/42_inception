CREATE DATABASE wordpress_db --what if already in database?
CREATE USER 'lisa'@'%' IDENTIFIED BY 'root_password';
GRANT ALL PRIVILEGES ON *.* TO 'lisa'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- needs to be variable???