#!bin/bash
set -e

# go to root folder
cd ../../

# ========== Make sure to run task 1, 2, 3 before running this task ==========

# delete all containers
docker rm -f $(docker ps -a -q) || true

# build container
cd Labsetup
docker-compose build

# start container (in new terminal window)
gnome-terminal -- sh -c "docker-compose up"   # https://askubuntu.com/a/485007
sleep 2

# give neccessary files to the container
sudo chmod 777 volumes
cp ../Task/Task4/duy2022_apache_ssl.conf ./volumes
cp ../server.crt ./volumes
cp ../server.key ./volumes

# write commands in the container
CONTAINER_ID=$(docker ps --format "{{.ID}}")
CONTAINER_COMMANDS=$(cat ../Task/Task4/container_commands.sh)
docker exec -it $CONTAINER_ID /bin/bash -c "$CONTAINER_COMMANDS"

# Add this to /etc/hosts
# 10.9.0.80	www.duy2022.com

xdg-open https://www.duy2022.com
# Firefox will show "Warning: Potential Security Risk Ahead"
# to fix it, open about:preferences#privacy, scroll down to Certificates, click View Certificates...
# go to tab Authorities, click Import, and choose the ca.crt file that was generated in Task 1
# tick "Trust this CA to identify websites" -> OK
# close the browser, reopen https://www.duy2022.com to see the result

# stop the container using "docker-compose down" if needed
