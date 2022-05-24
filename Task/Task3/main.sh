#!bin/bash
set -e

# go to root folder
cd ../../

# 1. Configuring DNS
# edit /etc/hosts to add IP address of PKILab2022.com
sudo gedit /etc/hosts

# 2. Configuring the web server

# Combine secret key and certificate into server.pem
cp server.key server.pem
cat server.crt >> server.pem

# Launch the web server
openssl s_server -cert server.pem -www -key server.key -pass pass:123456 -port 5000
# browse to https://pkilab2022.com:5000

# 3. Import CA Certificate to browser
# Search for "certificate" in Firefox's Preferences page, click on "View Certificates" and enter "certificate manager", click on "Authorities tab" and import CA.crt. Check "Trust this CA to identify web sites".

# 4. Testing our HTTPS website

# Modify one byte in server.pem
sudo gedit server.pem

# Use localhost
# Access to https://localhost:5000/