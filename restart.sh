#!/bin/bash
docker-compose down --rmi all --volumes
docker-compose up -d --force-recreate

