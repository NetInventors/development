FROM webdevops/php-apache:7.2

# Install Google Chrome
RUN curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash

RUN apt-install mysql-client nodejs google-chrome-stable libicu-dev

# intl support
RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl

COPY php-config.ini /usr/local/etc/php/conf.d/

COPY wait-for-it.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wait-for-it.sh

COPY addExternalUser.sh /addExternalUser
RUN chmod +x /addExternalUser

ENV COMPOSER_CACHE_DIR=/.composer/cache
ENV WEB_DOCUMENT_ROOT=/app/public

WORKDIR /app