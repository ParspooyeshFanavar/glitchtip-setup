default: up migarte

setup: generate-env up migarte create-superuser

generate-env:
	bash generate-env.sh

up:
	docker-compose --env-file .env up -d

up-fg:
	docker-compose --env-file .env up

migarte:
	bash migrate.sh

down:
	docker-compose --env-file .env down

create-superuser:
	bash ./create-superuser.sh

db-shell:
	bash db-shell.sh

