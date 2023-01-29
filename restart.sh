#!/bin/bash
docker-compose down && \
docker volume rm $(docker volume ls -q) || true && \
docker-compose up -d --force-recreate

