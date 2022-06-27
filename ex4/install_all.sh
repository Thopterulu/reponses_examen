#!/bin/sh
# brew on macOS, sudo apt install on Lunix based
brew install docker
# on créer l'image à partir du dockerfile
docker build -t debianssh .
# lancement de l'image
docker run -p 2222:22 -d debianssh
# il suffit alors de taper sur le port 2222 en localhost avec ssh et de lancer les scripts
ssh root@localhost -p 2222
# copie du script sur la machine cible
scp ./script.py .
# droits d'exec
chmod +x script.py
# balancer les sorties vers un fichier de sortie et std et err
python script.py 2>&1 > output.txt
# on copie la sortie
scp . ./output.txt
