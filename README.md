# auto-certbot-alpine
Auto update Let's Encrypt.

# Run build and run
    docker compose --file ./docker-compose.yml --env-file ./.env up --force-recreate --remove-orphans -d --build 

# TODO
AC-1: init

AC-2: jail nginx-80-http-400
