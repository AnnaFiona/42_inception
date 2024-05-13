CREATE USER 'lisa'@'172.30.0.%' IDENTIFIED BY 'root_password';
GRANT ALL PRIVILEGES ON *.* TO 'lisa'@'172.30.0.%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- needs to be variable???