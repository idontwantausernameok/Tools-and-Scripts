FROM docker.io/openjdk
RUN microdnf update \
 && microdnf install --nodocs wget unzip \
 && microdnf clean all \
 && rm -rf /var/cache/yum
ADD BotFiles /usr/local/JMusicBot
WORKDIR /usr/local/JMusicBot
RUN chmod +x JMusicBot.sh
#ADD https://github.com/jagrosh/MusicBot/releases/download/0.3.5/JMusicBot-0.3.5.jar JMusicBot.jar
ENTRYPOINT ["/bin/bash", "/usr/local/JMusicBot/JMusicBot.sh"]
#CMD ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]
