up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml  down

build:
	docker compose -f ./srcs/docker-compose.yml  build

rmv:
	docker volume rm srcs_wp_website_files srcs_wp_db
	sudo rm -rf /home/aplank/data/*

sysprune:
	docker system prune

fclean: down sysprune rmv

new: fclean build up