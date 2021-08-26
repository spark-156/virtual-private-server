setup:
	docker volume create vps-caddy-data

start:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

restart: down start
