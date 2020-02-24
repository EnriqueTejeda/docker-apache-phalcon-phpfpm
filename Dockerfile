FROM php:7.2-fpm-alpine
LABEL maintainer="Enrique Tejeda <github.com/EnriqueTejeda>"

ARG NAME_DIRECTORY_TEMP=/tmp/downloads
ARG PSR_VERSION=0.7.0
ARG PHALCON_VERSION=3.4.5
ARG PHALCON_EXT_PATH=php7/64bits

# Install apache & utils pkg 
RUN apk update && apk upgrade && \
    apk add apache2 apache2-proxy libpng-dev libxml2-dev libtool

COPY defaults/httpd.conf /etc/apache2/httpd.conf

# Install phalcon & utils for PHP
WORKDIR $NAME_DIRECTORY_TEMP
RUN curl -L https://github.com/jbboehr/php-psr/archive/v${PSR_VERSION}.tar.gz -o psr.tar.gz && \
    tar xzf psr.tar.gz && \
    curl -L https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz  -o phalcon.tar.gz && \
    tar xzf phalcon.tar.gz && \
    docker-php-ext-install -j $(getconf _NPROCESSORS_ONLN) \
        ${PWD}/php-psr-${PSR_VERSION} \
        ${PWD}/cphalcon-${PHALCON_VERSION}/build/${PHALCON_EXT_PATH} \
        gd mbstring soap xml ctype json && \
    # Cleaning data
    rm -r ${PWD}

# Copy the scripts for run the services
COPY ./boot.sh /sbin/boot.sh  

# https://sanjeevan.co.uk/blog/running-services-inside-a-container-using-runit-and-alpine-linux/
RUN apk add runit  && \
    chmod +x /sbin/boot.sh && \
    mkdir /etc/run_once

# Make the services in alpine
COPY services/apache2/run /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run

COPY services/phpfpm/run /etc/service/phpfpm/run
RUN chmod +x /etc/service/phpfpm/run

# Error PID
RUN mkdir -p /run/apache2
RUN mkdir -p /run/phpfpm

EXPOSE 80
CMD [ "/sbin/boot.sh" ]
