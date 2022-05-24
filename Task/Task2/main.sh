#!bin/bash
set -e

# go to root folder
cd ../../

# 1. Generate public/private key pair
openssl genrsa -aes128 -out server.key -passout pass:123456 1024
openssl rsa -in server.key -text -noout -passin pass:123456

# 2. Generate a Certificate Signing Request (CSR)
openssl req -new -key server.key -out server.csr -config openssl.cnf \
        -subj "/C=VN/ST=HCM/L=HCM/O=HCMUS/OU=HCMUS/CN=PKILab2022.com" \
        -passin pass:123456

# 3. Generating Certificates
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf \
        -passin pass:123456 -batch