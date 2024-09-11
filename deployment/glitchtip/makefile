default: up migarte

up:
	docker-compose --env-file .env up -d

up-fg:
	docker-compose --env-file .env up

migarte:
	bash migrate.sh

down:
	docker-compose --env-file .env down
	