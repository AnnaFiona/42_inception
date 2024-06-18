up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml  down

build:
	docker compose -f ./srcs/docker-compose.yml  build

rmv:
	sudo rm -rf /home/aplank/data/wp_website_files /home/aplank/data/wp_db
	sudo mkdir /home/aplank/data/wp_website_files /home/aplank/data/wp_db

sysprune:
	docker system prune

fclean: down sysprune rmv

new: fclean build up