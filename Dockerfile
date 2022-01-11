FROM php:7.2-fpm

ARG uid=1000
ARG user={ add username here }

RUN apt update && apt install -y  git curl libpng-dev libonig-dev libxml2-dev zip unzip 

RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/etc/php/conf.d/ && printf "memory_limit = -1 \nupload_max_filesize = 20M \npost_max_size = 20M\n" >> /usr/local/etc/php/conf.d/docker-php-memory-limit.ini

RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd json xml zip

RUN useradd -G www-data,root -u $uid -d /home/$user $user

RUN mkdir -p /home/$user/.composer && chown -R $user:$user /home/$user

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

USER $user
