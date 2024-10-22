FROM php:apache

RUN apt update
RUN apt upgrade -y
RUN apt install -y apt-utils curl snmp libbz2-dev libicu-dev libcurl4-openssl-dev libxml2-dev bzip2 zlib1g-dev libpng-dev libsqlite3-dev libsnmp-dev libgmp-dev libonig-dev freetds-dev
RUN a2enmod rewrite
RUN docker-php-ext-install snmp
RUN echo "extension=snmp.so" >> /usr/local/etc/php/conf.d/snmp.ini

RUN docker-php-ext-install pdo_sqlite

RUN docker-php-ext-install bz2
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install calendar
RUN docker-php-ext-install curl
RUN docker-php-ext-install ctype
RUN docker-php-ext-install dba
RUN docker-php-ext-install dl_test
RUN docker-php-ext-install dom
RUN docker-php-ext-install exif
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install filter
RUN docker-php-ext-install ftp
RUN docker-php-ext-install gd
RUN docker-php-ext-install gettext
RUN docker-php-ext-install gmp
RUN docker-php-ext-install iconv
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pcntl 
RUN docker-php-ext-install pdo_dblib 

RUN apt install -y firebird-dev
RUN docker-php-ext-install pdo_firebird 
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install phar
RUN docker-php-ext-install posix

RUN apt install -y libpspell-dev
RUN docker-php-ext-install pspell

RUN docker-php-ext-install session
RUN docker-php-ext-install shmop
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install soap
RUN docker-php-ext-install sockets

RUN apt install -y libsodium-dev
RUN docker-php-ext-install sodium

RUN docker-php-ext-install sysvmsg
RUN docker-php-ext-install sysvsem
RUN docker-php-ext-install sysvshm

RUN apt install -y libtidy-dev
RUN docker-php-ext-install tidy

RUN docker-php-ext-install xml

RUN docker-php-ext-install xmlwriter

RUN apt install -y libxslt1-dev
RUN docker-php-ext-install xsl

RUN apt install -y libzip-dev
RUN docker-php-ext-install zip

COPY ./mydomain.conf /etc/apache2/sites-available/mydomain.conf
RUN a2ensite mydomain.conf

WORKDIR /var/www/html