#!bin/bash
set -e

# go to root folder
cd ../../

# generating certificate
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf \
        -passin pass:123456 -batch
    
# decoded content of X509 certificate
openssl x509 -in server.crt -out server.crt.txt -text