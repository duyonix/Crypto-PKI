cd /volumes

# generate new CA's certificate from CA's private key
openssl req -new -x509 -key ca.key -out ca.crt -config openssl.cnf -subj "/C=VN/ST=HCM/L=HCM/O=HCMUS/OU=HCMUS/CN=www.hcmusCA.com" -passin pass:123456

# generate a certificate request for www.google.com (Task 2)
openssl req -newkey rsa:2048 -sha256 -keyout google.key -out google.csr -subj "/CN=www.google.com/O=Google Inc./C=US" -passout pass:123456

# generate a certificate for www.google.com (Task 3)
openssl ca -config openssl.cnf -policy policy_anything -md sha256 -days 3650 -in google.csr -out google.crt -batch -cert ca.crt -keyfile ca.key -passin pass:123456

# copy generated certificate and private key to the certs folder
cp google.crt google.key /certs

# copy new google site config file to the sites-available folder
# this config file use google.crt, google.key (generated from above commands) instead of server.crt, server.key
cp google_apache_ssl.conf /etc/apache2/sites-available

# passphrase:
# www.google.com: 123456
# www.bank32.com: dees
service apache2 restart
