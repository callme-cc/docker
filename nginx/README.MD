## nginx

very tiny nginx from alpine,only 6.1MB

nginx version 1.11.3

## Usage

```
FROM suconghou/nginx
WORKDIR /src
ADD . .
RUN cp nginx.conf /etc/nginx/nginx.conf
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
```
