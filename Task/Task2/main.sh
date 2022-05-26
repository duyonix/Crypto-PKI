#!bin/bash
set -e

# go to root folder
cd ../../

# generate a Certificate Signing Request (CSR)
openssl req -new -keyout server.key -out server.csr -config openssl.cnf \
        -subj "/C=VN/ST=HCM/L=HCM/O=HCMUS/OU=HCMUS/CN=www.duy2022.com" \
        -passout pass:123456 \
        -addext "subjectAltName = DNS:www.duy2022.com, DNS:www.duy2022a.com, DNS:www.duy2022b.com"

# decoded content of CSR and private key
openssl req -in server.csr -out server.csr.txt -text
openssl rsa -in server.key -out server.key.txt -text -passin pass:123456