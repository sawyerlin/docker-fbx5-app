FROM debian:latest
MAINTAINER Sawyer LIN <sawyer.lin@gmail.com>

RUN echo 'deb http://ftp.fr.debian.org/debian/ jessie non-free' >> /etc/apt/sources.list
RUN echo 'deb-src http://ftp.fr.debian.org/debian/ jessie non-free' >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install apache2 libapache2-mod-fastcgi

RUN rm /etc/apache2/sites-enabled/*

ENV VIRTUALHOST slin.dev

ADD conf-available /etc/apache2/conf-available
ADD sites-available /etc/apache2/sites-available

EXPOSE 80

ADD apache.sh /usr/bin/apache.sh
RUN chmod +x /usr/bin/apache.sh
ENTRYPOINT apache.sh

VOLUME /var/www
WORKDIR /var/www
