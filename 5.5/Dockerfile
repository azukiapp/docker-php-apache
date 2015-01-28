# The container includes:
#
# - Git
# - Apache2
# - PHP Version 5.5.9
# - Composer
# - Node
# - MySQL Client
# - PostgreSQL Client
# - MongoDB
#

FROM azukiapp/node
MAINTAINER Azuki <support@azukiapp.com>

# Install PHP5 + Apache2 + Libs
RUN apt-get update -qq \
  && apt-get install -y -qq \
        apache2 \
        libxml2 \
        libcurl4-openssl-dev \
        libapache2-mod-php5 \
        php5-dev \
        php5-cli \
        php5-mysql \
        php5-pgsql \
        php5-mcrypt \
        php5-curl \
        php5-json \
        php5-gd \
        php-pear \
        php-apc \
  && pecl install mongo \
  && apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Enable php and apache modules
RUN echo "extension=mongo.so" > /etc/php5/mods-available/mongo.ini
RUN a2enmod rewrite && \
    php5enmod mcrypt mongo

RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
RUN sed -i 's/\/var\/www\/html/\/var\/www/g' /etc/apache2/sites-available/000-default.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www && ln -s /app /var/www
ADD sample/ /app

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
