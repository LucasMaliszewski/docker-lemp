docker-lempev
===========

[![Docker Stars](https://img.shields.io/docker/stars/stenote/docker-lemp.svg)](https://hub.docker.com/r/stenote/docker-lemp/)
[![Docker Pulls](https://img.shields.io/docker/pulls/stenote/docker-lemp.svg)](https://hub.docker.com/r/stenote/docker-lemp/)


Developer enviornment LEMP + Varnish + Elasticsearch (Works well for Magento 2.2[.2~.5] Cloud environment setup)

Don't use it in product environment.

# Usage
    docker run -d --name=lemp \
      -v /path/to/www/:/var/www/ \
      -v /path/to/mysql:/var/lib/mysql \
      -v /path/to/.ssh:/root/.ssh \
      -p port_of_nginx:80 \
      lucasmali/lempev:latest

# Detail
Ubuntu 17 with PHP 7.1-FPM

To match up with a Magento cloud environment using Nginx and PHP 7.1-FPM this Deprecated, not so deprecated repo Setnote built was the perfect solution.

WARNING!
Windows machines may have an issue with the line ending ^M that you may need to accommodate for before using.
See:

https://stackoverflow.com/questions/1110678/m-at-the-end-of-every-line-in-vim
https://stackoverflow.com/questions/12508923/find-and-remove-dos-line-endings-on-ubuntu

Origins: https://hub.docker.com/r/stenote/docker-lemp/

## MySQL
* user: root
* (No password)

## SSH
We don't support SSH right now. You can use `docker exec` to enter the docker container.
