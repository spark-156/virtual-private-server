setup-proxy-network:
	docker network create proxy

start:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

pull:
	docker compose pull

update: pull start

restart: down start

prune-images:
	docker image prune
