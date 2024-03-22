#!/bin/bash
docker stop JMusicBot
docker rm JMusicBot
docker build -t jmusicbot.image .
docker create --name JMusicBot jmusicbot.image
docker start JMusicBot
docker update --restart unless-stopped JMusicBot
