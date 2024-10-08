# 基础镜像
FROM php:8.3.12-fpm

# 作者信息
LABEL authors="xiaoqidun"

# 安装扩展
RUN pecl install redis-6.1.0RC1 \
    && docker-php-ext-enable redis

RUN pecl install xdebug-3.3.2 \
    && docker-php-ext-enable xdebug

RUN pecl install runkit7-4.0.0a6 \
    && docker-php-ext-enable runkit7

RUN docker-php-ext-install -j$(nproc) \
    dba \
    exif \
    pcntl \
    shmop \
    bcmath \
    gettext \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    calendar \
    mysqli \
    pdo_mysql

RUN apt-get update \
    && apt-get install -y \
    libpng-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    && docker-php-ext-configure gd \
    --with-jpeg \
    --with-freetype \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get update \
    && apt-get install -y \
    libffi-dev \
    && docker-php-ext-configure ffi \
    --with-ffi \
    && docker-php-ext-install -j$(nproc) ffi

RUN apt-get update \
    && apt-get install -y \
    libzip-dev \
    && docker-php-ext-install -j$(nproc) zip

RUN apt-get update \
    && apt-get install -y \
    libbz2-dev \
    && docker-php-ext-install -j$(nproc) bz2

RUN apt-get update \
    && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install -j$(nproc) \
    pgsql \
    pdo_pgsql

RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install -j$(nproc) opcache
