FROM dockage/alpine-nginx-php-fpm:latest

LABEL maintainer="Mohammad Abdolirad <m.abdolirad@gmail.com>" \
    org.label-schema.name="phppgadmin" \
    org.label-schema.vendor="Dockage" \
    org.label-schema.description="phpPgAdmin Docker image, phpPgAdmin is a web-based administration tool for PostgreSQL." \
    org.label-schema.vcs-url="https://github.com/dockage/phppgadmin" \
    org.label-schema.license="MIT"

ADD ./assets ${DOCKAGE_ETC_DIR}

RUN apk del 'php5-*' \
    && rm /usr/bin/php-fpm \
    && apk --no-cache --update add php7-fpm php7-pgsql php7-session php7-mbstring postgresql \
    && ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm \
    && ln -s /etc/php7 /etc/php5 \
    && runit-enable-service php-fpm \
    && ${DOCKAGE_ETC_DIR}/buildtime/install \
    && cp -ar ${DOCKAGE_ETC_DIR}/etc/* /etc \
    && rm -rf /var/cache/apk/* ${DOCKAGE_ETC_DIR}/etc ${DOCKAGE_ETC_DIR}/buildtime
