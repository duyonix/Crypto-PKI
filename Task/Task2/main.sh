#!bin/bash
set -e

# go to root folder
cd ../../

# generate public/private key pair
openssl genrsa -aes128 -out server.key -passout pass:123456 1024

# generate a Certificate Signing Request (CSR)
openssl req -new -keyout server.key -out server.csr -config openssl.cnf \
        -subj "/C=VN/ST=HCM/L=HCM/O=HCMUS/OU=HCMUS/CN=pkilab2022.com" \
        -passout pass:123456 \
        -addext "subjectAltName = DNS:pkilab2022.com, DNS:pkilab2022a.com, DNS:pkilab2022b.com"

# decoded content of CSR and private key
openssl req -in server.csr -out server.csr.txt -text
openssl rsa -in server.key -out server.key.txt -text -passin pass:123456