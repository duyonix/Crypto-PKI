#!bin/bash
set -e

# go to root folder
cd ../../

# ========== Make sure to run task 1, 2, 3, 4, 5 before running this task ==========

# This task we will pretend the container is the attacker and he/she already has the CA's private key

# give neccessary files to the container
cp openssl.cnf Labsetup/volumes
cp -r demoCA Labsetup/volumes
cp ca.key Labsetup/volumes
cp Task/Task6/google_apache_ssl.conf Labsetup/volumes

# write commands in the container
cd Task/Task6
CONTAINER_ID=$(docker ps --format "{{.ID}}")
CONTAINER_COMMANDS=$(cat container_commands.sh)
docker exec -it $CONTAINER_ID /bin/bash -c "$CONTAINER_COMMANDS"

xdg-open https://www.google.com
