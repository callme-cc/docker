## nodejs

nodejs docker is very easy , you can just user the `alpine` and run `apk update && apk upgrade && apk add --no-cache nodejs` in your application docker , and then copy your code

it's node version is v6.2.0 , and with npm,you can update npm and package with `npm update -g`

## MongoDb

## NodeJs

```
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
apk upgrade --update
apk add --no-cache mongodb nodejs
```
