FROM php:7.2-rc-fpm-alpine3.6
RUN set -xe \
    && docker-php-ext-install pdo_mysql \
    && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install -o -f redis  \
	&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
    && curl -fsSL 'http://mirrors.hust.edu.cn/apache/thrift/0.10.0/thrift-0.10.0.tar.gz' -o thrift.tar.gz \
    && mkdir -p thrift \
    && tar -xf thrift.tar.gz -C thrift --strip-components=1 \
    && rm thrift.tar.gz \
    && ( \
        cd thrift/lib/php/src/ext/thrift_protocol \
        && phpize \
        && ./configure  \
        && make  \
        && make install \
       ) \
    && rm -r thrift \
    && echo "extension=thrift_protocol.so" > /usr/local/etc/php/conf.d/thrift_protocol.ini \
    && curl -fsSL 'https://mirrors.shuosc.org/apache/zookeeper/zookeeper-3.3.6/zookeeper-3.3.6.tar.gz' -o zk.tar.gz \
    && mkdir -p zk \
    && tar -xf zk.tar.gz -C zk --strip-components=1 \
    && rm zk.tar.gz \
    && ( \
        cd zk/src/c \
        && ./configure  \
        && make  \
        && make install \
       )\
    && curl -fsSL 'https://pecl.php.net/get/zookeeper-0.4.0.tgz' -o zookeeper.tar.gz \
    && mkdir -p zookeeper \
    && tar -xf zookeeper.tar.gz -C zookeeper --strip-components=1 \
    && rm zookeeper.tar.gz \
    && ( \
        cd zookeeper \
        && phpize \
        && ./configure  \
        && make -j$(nproc) \
        && make install \
       ) \
	&& echo "extension=zookeeper.so" > /usr/local/etc/php/conf.d/zookeeper.ini \
    && rm -r zookeeper \
    && rm -r zk \
    && rm -rf /usr/share/php \
    && rm -rf /tmp/* \
