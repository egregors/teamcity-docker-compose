# https://github.com/egregors/teamcity-docker-compose
# Team City

COMPOSE_FILE=docker-compose.yml
all: uplog

# update & upgrade TC
update: stop down build uplog
up: acme uplog

# up and show logs
uplog:
	docker-compose -f $(COMPOSE_FILE) up -d && docker-compose -f $(COMPOSE_FILE) logs -f -t --tail=10

stop:
	docker-compose -f $(COMPOSE_FILE) stop

build:
	docker-compose -f $(COMPOSE_FILE) build --pull --no-cache

down:
	docker-compose -f $(COMPOSE_FILE) down --rmi all

acme:
	mkdir -p /opt/traefik && touch /opt/traefik/acme.json && chmod 600 /opt/traefik/acme.json