apk update && apk upgrade
apk --update add gcc g++ make wget file openssl-dev pcre-dev zlib-dev libxml2-dev curl-dev jpeg-dev  libpng-dev freetype-dev libmcrypt-dev bzip2-dev libxslt-dev
cd /tmp
PHP_VERSION=php-7.0.10
CPU_NUM=`cat /proc/cpuinfo | grep processor | wc -l`
wget http://php.net/distributions/${PHP_VERSION}.tar.xz
tar xJf ${PHP_VERSION}.tar.xz
cd ${PHP_VERSION}
export CFLAGS="-O3"
./configure --enable-inline-optimization --enable-static=yes --prefix=/usr/local --with-config-file-path=/etc --without-pear --disable-cgi --disable-opcache --disable-fpm  --enable-posix --enable-pcntl --enable-sockets --enable-ftp --enable-bcmath  --enable-zip --enable-mbstring --enable-gd-native-ttf --with-iconv --with-mysqli --with-pdo-mysql --with-curl --with-gd --with-freetype-dir=/usr/include/freetype2 --with-png-dir=/usr/include --with-jpeg-dir=/usr/include --with-openssl --with-mcrypt --enable-exif --enable-calendar  --with-xsl --with-bz2
make -j$CPU_NUM && make install
mv /tmp/${PHP_VERSION}/php.ini-production /etc/php.ini
strip -s /usr/local/bin/php
sed -i '/^expose_php.*/cexpose_php = Off' /etc/php.ini
cd /
tar czvf php.tar.gz /usr/local/bin/php /etc/php.ini /usr/lib/libexslt.so.0 /usr/lib/libexslt.so.0.8.17 /usr/lib/libmcrypt.so.4 /usr/lib/libmcrypt.so.4.4.8 /usr/lib/libpng16.so.16 /usr/lib/libpng16.so.16.21.0 /usr/lib/libjpeg.so.8 /usr/lib/libjpeg.so.8.0.2 /usr/lib/libcurl.so.4 /usr/lib/libcurl.so.4.4.0 /usr/lib/libbz2.so.1 /usr/lib/libbz2.so.1.0.6 /usr/lib/libxml2.so.2 /usr/lib/libxml2.so.2.9.4 /usr/lib/libfreetype.so.6 /usr/lib/libfreetype.so.6.12.3 /usr/lib/libxslt.so.1 /usr/lib/libxslt.so.1.1.29 /usr/lib/libgcrypt.so.20 /usr/lib/libgcrypt.so.20.1.0  /usr/lib/libgpg-error.so.0 /usr/lib/libgpg-error.so.0.18.0  /usr/lib/libssh2.so.1 /usr/lib/libssh2.so.1.0.1
