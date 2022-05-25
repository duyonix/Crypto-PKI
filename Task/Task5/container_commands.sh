cd /var/www
cp -r duy2022 ./google

cd /etc/apache2/sites-available
cp /volumes/google_apache_ssl.conf .
a2ensite google_apache_ssl

# passphrase:
# www.google.com: 123456
# www.bank32.com: dees
service apache2 restart
