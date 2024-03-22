#!/bin/bash
docker run --user $(id -u):$(id -g) -v $PWD/server:/opt/server -p 6969-6972:6969-6972/tcp -p 6969-6972:6969-6972/udp -it --name sitcoop --restart unless-stopped stayintarkov/stayintarkov
