#!/bin/bash

# up
docker compose --file ./docker-compose.yml --env-file ./.env up --force-recreate --remove-orphans -d --build || (echo 'Error docker compose up' && exit 1)
docker compose --file ./docker-compose.yml --env-file ./.env ps
