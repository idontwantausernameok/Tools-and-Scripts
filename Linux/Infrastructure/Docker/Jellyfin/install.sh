#!/bin/bash
docker run -d --name jellyfin --user $(id -u):$(id -g) -p 8096:8096/tcp -p 1900:1900/udp -p 7359:7359/udp --volume $PWD/config:/config --volume $PWD/cache:/cache --mount type=bind,source=/mnt/nfs/media,target=/media --restart=unless-stopped jellyfin/jellyfin:unstable
