FROM remote-host



RUN yum update -y && \
    yum -y install nginx  \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
    https://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
    dnf -y install dnf-utils && \
    dnf -y module install php:remi-7.4 && \
    yum -y install php-devel \
    php-opcache \
    php-pear \
    php-cli \
    php-process \
    php-json \
    php-pdo \
    php-gd \
    php-common \
    php-fpm \
    php-mysqlnd \
    php-bcmath \
    php-xml \
    php-mbstring && \
    mkdir -p /run/php-fpm &&  \
    yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN sed -i -e 's/\/usr\/share\/nginx/\/var\/www/g' /etc/nginx/nginx.conf

RUN chmod -R 777 /var/www/html

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh

