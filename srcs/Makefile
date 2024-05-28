up:
	docker compose up

down:
	docker compose down

build:
	docker compose build



mb:
	docker build -t annafiona/mariadb ./MariaDB

rmv:
	docker volume rm srcs_wp_db srcs_wp_website_files

sysprune:
	docker system prune

fclean: down sysprune
	docker rmi annafiona/mariadb annafiona/nginx annafiona/wordpress
	make rmv
	make down