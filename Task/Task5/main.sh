#!bin/bash
set -e

# go to root folder
cd ../../

cd Task/Task5

# give neccessary files to the container
cp google_apache_ssl.conf ../../Labsetup/volumes

# write commands in the container
CONTAINER_ID=$(docker ps --format "{{.ID}}")
CONTAINER_COMMANDS=$(cat container_commands.sh)
docker exec -it $CONTAINER_ID /bin/bash -c "$CONTAINER_COMMANDS"

# Add this to /etc/hosts
# 10.9.0.80	www.google.com

xdg-open https://www.google.com
# firefox will show "Did Not Connect: Potential Security Issue", this will be fixed in Task 6
