# pfenv
php-fpm environment

# docker

## 拉取镜像
```
docker pull xiaoqidun/pfenv:latest
```

## docker-compose
```
version: '3.8'
services: 
    php-fpm:
        image: 'xiaoqidun/pfenv'
        restart: 'always'
        container_name: 'php-fpm'
        volumes:
            - '/www:/www'
```

# nginx server
```
server {
    listen 80;
    listen [::]:80;

    server_name aite.xyz;

    root /www/aite.xyz;
    index index.htm index.html index.php default.htm default.html default.php;

    autoindex on;
    autoindex_localtime on;
    autoindex_exact_size on;

    location ~ \.php$ {
        fastcgi_pass php-fpm:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
```
