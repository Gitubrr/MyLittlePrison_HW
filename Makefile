.PHONY: help up down cli import reset

DB_CONTAINER = prison_mysql
DB_USER = root
DB_PASS = rootpass
DB_NAME = prison_system

help:
	@echo "Available commands:"
	@echo "  make up      - Start the database container"
	@echo "  make down    - Stop the container (data will persist)"
	@echo "  make reset   - Completely delete the database and recreate it (clean start)"
	@echo "  make import  - Re-import all .sql files from src/ into the current database"
	@echo "  make cli     - Open MySQL console inside the container"

up:
	docker-compose up -d

down:
	docker-compose down

reset: down
	docker-compose down -v
	docker-compose up -d
	@echo "Database recreated from scratch, initialization complete"

import:
	@echo "Importing schema..."
	docker exec -i $(DB_CONTAINER) mysql -u$(DB_USER) -p$(DB_PASS) $(DB_NAME) < src/init.sql
	@echo "Import completed"

cli:
	docker exec -it $(DB_CONTAINER) mysql -u$(DB_USER) -p$(DB_PASS) $(DB_NAME)