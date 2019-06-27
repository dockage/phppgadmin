FROM dockage/alpine-nginx-php-fpm:latest

LABEL maintainer="Mohammad Abdolirad <m.abdolirad@gmail.com>" \
    org.label-schema.name="phppgadmin" \
    org.label-schema.vendor="Dockage" \
    org.label-schema.description="phpPgAdmin Docker image, phpPgAdmin is a web-based administration tool for PostgreSQL." \
    org.label-schema.vcs-url="https://github.com/dockage/phppgadmin" \
    org.label-schema.license="MIT"

ADD ./assets ${DOCKAGE_ETC_DIR}

RUN apk --no-cache --update add php5-pgsql postgresql \
    && ${DOCKAGE_ETC_DIR}/buildtime/install \
    && cp -ar ${DOCKAGE_ETC_DIR}/etc/* /etc \
    && rm -rf /var/cache/apk/* ${DOCKAGE_ETC_DIR}/etc ${DOCKAGE_ETC_DIR}/buildtime
