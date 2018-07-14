FROM ubuntu:17.10

ENV DEBIAN_FRONTEND noninteractive

## Install php nginx supervisor
RUN apt-get update && \
    apt-get install -y php7.1-fpm php7.1-mysql php7.1-gd php7.1-mcrypt php7.1-mysql php7.1-curl php7.1-cli \
    nginx \
    curl \
    supervisor \
    wget

# Composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php; \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

## Configuration
RUN sed -i 's/^listen\s*=.*$/listen = 127.0.0.1:9000/' /etc/php/7.1/fpm/pool.d/www.conf && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cgi.log/' /etc/php/7.1/fpm/php.ini && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cli.log/' /etc/php/7.1/cli/php.ini && \
    sed -i 's/^key_buffer\s*=/key_buffer_size =/' /etc/mysql/my.cnf

RUN mkdir -p /root/.ssh

COPY files/root /

WORKDIR /var/www/

VOLUME ["/var/www/", "/var/lib/mysql/", "/root/.ssh/", "/etc/nginx/sites-enabled"]

EXPOSE 80 443 9000

ENTRYPOINT ["/entrypoint.sh"]
