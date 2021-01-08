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
