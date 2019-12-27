FROM nextcloud

ARG NODE_VERSION=12

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip

# installing nvm/node/npm
RUN mkdir /usr/local/nvm

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION=$NODE_VERSION

# https://github.com/creationix/nvm#install-script
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# installing composer
RUN cd ~/ && curl --silent --show-error https://getcomposer.org/installer | php
RUN echo "\n\
#!/bin/bash \n\
php /root/composer.phar \"\$@\" \n\
" > /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer