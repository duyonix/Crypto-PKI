cd /var/www
cp -r bank32 ./duy2022

cd /certs
cp /volumes/server.crt /volumes/server.key .

cd /etc/apache2/sites-available
cp /volumes/duy2022_apache_ssl.conf .

a2ensite duy2022_apache_ssl

# passphrase:
# www.duy2022.com: 123456
# www.bank32.com: dees
service apache2 restart
