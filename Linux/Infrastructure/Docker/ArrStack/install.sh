#!/bin/bash
docker compose pull
docker compose up --force-recreate --build --detach
docker image prune
