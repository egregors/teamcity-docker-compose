# https://github.com/egregors/teamcity-docker-compose
# Team City

COMPOSE_FILE=docker-compose.yml
all: help  # Show this message

# update & upgrade TC
update: stop down build uplog  ## Update images
up: acme uplog  ## Up services

# up and show logs
uplog:  # Up services and show logs
	docker-compose -f $(COMPOSE_FILE) up -d && docker-compose -f $(COMPOSE_FILE) logs -f -t --tail=10

stop:  ## Stop services
	docker-compose -f $(COMPOSE_FILE) stop

build:  ## Build all images
	docker-compose -f $(COMPOSE_FILE) build --pull --no-cache

down:  ## Stop services and cleanup
	docker-compose -f $(COMPOSE_FILE) down --rmi all

acme:  ## Create folder and file for acme credentials
	mkdir -p /opt/traefik && touch /opt/traefik/acme.json && chmod 600 /opt/traefik/acme.json


## Help

help: ## Show help message
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/:/'`); \
	printf "%s\n\n" "Usage: make [task]"; \
	printf "%-20s %s\n" "task" "help" ; \
	printf "%-20s %s\n" "------" "----" ; \
	for help_line in $${help_lines[@]}; do \
		IFS=$$':' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf '\033[36m'; \
		printf "%-20s %s" $$help_command ; \
		printf '\033[0m'; \
		printf "%s\n" $$help_info; \
	done