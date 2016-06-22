#! /bin/bash

sed -i -e "s/\[VIRTUALHOST\]/$VIRTUALHOST/g" /etc/apache2/sites-available/host.conf
sed -i -e "s/\[PHP\]/$PHP/g" /etc/apache2/sites-available/host.conf
sed -i -e "s/\[PORT\]/$PORT/g" /etc/apache2/sites-available/host.conf
sed -i -e "s/\[APP\]/$APP/g" /etc/apache2/sites-available/host.conf

a2enmod proxy
a2enmod proxy_fcgi
a2enconf servername
a2ensite host
a2enmod rewrite
a2enmod expires

ln -sf /dev/stdout /var/log/apache2/access.log
ln -sf /dev/stderr /var/log/apache2/error.log

/usr/sbin/apache2ctl -D FOREGROUND
