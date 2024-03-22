#!/bin/bash
docker stop sitcoop
unzip server.zip
chown -R bol:bol server/
chmod +x ./server/Aki.Server.exe
docker start sitcoop
