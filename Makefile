up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml  down

build:
	docker compose -f ./srcs/docker-compose.yml  build

rmv:
	docker volume rm srcs_wp_db srcs_wp_website_files

sysprune:
	docker system prune

fclean: down sysprune
	docker rmi annafiona/mariadb annafiona/nginx annafiona/wordpress
	make rmv
	make down