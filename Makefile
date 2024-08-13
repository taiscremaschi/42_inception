NAME = inception

SRC_DIR = ./srcs

DOCKER_COMPOSE = docker-compose -f $(SRC_DIR)/docker-compose.yml
DOCKER = docker

all: up

up:
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans
	$(DOCKER) system prune --volumes -f

restart: down up

re: clean up
