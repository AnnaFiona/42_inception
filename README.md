# 42_inception
This project consists of setting up a small infrastructure made of multiple services, all running inside a virtual machine using Docker Compose.
Each service runs in its own dedicated container, built from a custom Dockerfile.

## Guidelines
We have to set up:
- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress with php-fpm (it must be installed
and configured) only, without nginx.
- A Docker container that contains only MariaDB, without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers.
