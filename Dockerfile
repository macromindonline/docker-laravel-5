FROM macromind/docker-apache-php70:1.0
MAINTAINER MACROMIND Online <idc@macromind.online>
LABEL description="Laravel 5.*"

RUN apt-get update && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
ADD conf/000-docker.conf /etc/apache2/sites-available/
RUN /usr/sbin/a2dissite '*' && /usr/sbin/a2ensite 000-docker

EXPOSE 80

WORKDIR /var/www/html/

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-D","FOREGROUND"]
