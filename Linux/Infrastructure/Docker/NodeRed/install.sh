#!/usr/bin/env bash

docker run -d --name node-red -p 1880:1880 -v $PWD/data:/data --restart unless-stopped nodered/node-red
cat installModules.sh | docker exec -i node-red bash
