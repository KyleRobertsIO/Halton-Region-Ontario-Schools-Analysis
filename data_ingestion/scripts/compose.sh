#!/bin/bash

docker image rm data_ingestion-db_init:latest -f
docker system prune -f
docker compose up