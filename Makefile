setup:
	touch acme.json && chmod 600 acme.json

start:
	docker-compose up -d

down: 
	docker-compose down

restart: down start