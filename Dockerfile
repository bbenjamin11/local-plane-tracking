# Image de base
FROM debian:jessie

# Installation de curl avec apt-get
RUN apt-get update \
&& apt-get install nodejs

# Ajout du fichier de dépendances package.json
ADD . /app/

# Changement du repertoire courant
WORKDIR /app

# Installation des dépendances
# RUN npm install -i

# On expose le port 8080
EXPOSE 8080

# On partage un dossier de log
VOLUME /app/log

# On lance le serveur quand on démarre le conteneur
CMD node app.js
