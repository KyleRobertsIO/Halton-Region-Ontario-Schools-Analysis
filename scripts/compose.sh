#!/bin/bash

docker image rm halton-region-ontario-schools-analysis-db_init:latest -f
docker system prune -f
docker compose up