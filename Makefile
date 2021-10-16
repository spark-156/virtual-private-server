
start:
	docker-compose up -d

setup:
	docker volume create vps-caddy-data

down:
	docker-compose down

logs:
	docker-compose logs -f

restart: down start
