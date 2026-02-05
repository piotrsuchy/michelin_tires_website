#!/bin/bash

docker compose -f docker-compose.yml -f docker-compose.prod.yml down 
# docker compose -f docker-compose.prod.yml build --no-cache 
docker compose -f docker-compose.yml up -d 
# docker compose -f docker-compose.prod.yml up -d --force-recreate
