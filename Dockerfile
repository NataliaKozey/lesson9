FROM nginx:latest
COPY default.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/html

RUN apt-get update && apt-get install -y php-fpm php-mysql php-imap php-gd php-curl php-cli php-dev php-cli php-common php-mbstring php-intl php-zip php-bcmath php-xml zip unzip
RUN sed -i 's/listen = .*/listen = 127.0.0.1:9000/' "/etc/php/8.2/fpm/pool.d/www.conf"
ADD https://suitecrm.com/download/141/suite714/563477/suitecrm-7-14-2.zip /tmp/suitecrm.zip
RUN unzip /tmp/suitecrm.zip -d /tmp \
    && mv /tmp/SuiteCRM-7.14.2/* /var/www/html/ \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/custom /var/www/html/modules /var/www/html/themes /var/www/html/data /var/www/html/upload


EXPOSE 80

CMD service php8.2-fpm start && nginx -g "daemon off;"