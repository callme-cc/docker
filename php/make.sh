#!/bin/bash
docker pull alpine
BUILDSH=$(cat build.sh)
docker run -it --name tmpbuild alpine sh -c "$BUILDSH"
rm -f ./php.tar.gz
docker cp tmpbuild:/php.tar.gz ./php.tar.gz
docker rm tmpbuild
docker build -t=suconghou/php -t=suconghou/php:cli .
