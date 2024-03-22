#!/bin/bash

curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest \
| grep "browser_download_url.*jar" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - -O JMusicBot.jar

java -Dnogui=true -jar JMusicBot.jar
