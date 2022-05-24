#!bin/bash
set -e

# go to root folder
cd ../../

# copy configuration file into current directory
cp /usr/lib/ssl/openssl.cnf ./openssl.cnf

# demoCA: Where everything is kept, here is file structure of demoCA
# certs: Where the issued certs are kept
# crl: Where the issued crl are kept
# newcerts: default place for new certs.
# index.txt: database index file.
# serial: The current serial number

mkdir demoCA
cd demoCA
mkdir certs crl newcerts
touch index.txt
echo "1000" > serial

# go to the parent directory
cd ../

# Subject input
# PEM pass phrase               = 123456
# Verify PEM pass phrase        = 123456
# Country Name		        = VN
# State Or Province Name        = HCM
# Locality Name		        = HCM
# Organization Name	        = HCMUS
# Organizational Unit Name	= HCMUS
# Common Name		        = www.duy2022.com
# Email Address		        = duy2022@gmail.com
openssl req -new -x509 -keyout ca.key -out ca.crt -config openssl.cnf \
        -subj "/C=VN/ST=HCM/L=HCM/O=HCMUS/OU=HCMUS/CN=www.duy2022.com" \
        -passout pass:123456

# decoded content of X509 certificate and RSA key
openssl x509 -in ca.crt -out ca.crt.txt -text
openssl rsa  -in ca.key -out ca.key.txt -text -passin pass:123456
