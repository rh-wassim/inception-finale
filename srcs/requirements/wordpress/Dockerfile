FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install wget -y && apt-get install vim -y

RUN apt-get install -y php php-fpm php-mysql mariadb-client

WORKDIR /var/www

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

COPY ./tools/sh_script.sh .

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN chmod 755 sh_script.sh

CMD [ "sh", "sh_script.sh"]
