up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml  down

build:
	docker compose -f ./srcs/docker-compose.yml  build

sysprune:
	docker system prune

fclean: down sysprune
	docker rmi annafiona/mariadb annafiona/nginx annafiona/wordpress
	make down