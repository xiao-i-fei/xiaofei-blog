# 项目部署

![image-20220612141638062](https://cdn.jsdelivr.net/gh/xiao-i-fei/typora/imgs/image-20220612141638062.png)

## MySQL的dockerfile文件

```yml
# 基础镜像
FROM mysql:8.0.19
# author
MAINTAINER xiaofei

# 执行sql脚本
ADD ./db/*.sql /docker-entrypoint-initdb.d/
```

## nginx配置文件

```conf
events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    client_max_body_size     50m;
    client_body_buffer_size  10m;
    client_header_timeout    1m;
    client_body_timeout      1m;

    gzip on;
    gzip_min_length  1k;
    gzip_buffers     4 16k;
    gzip_comp_level  4;
    gzip_types text/plain application/javascript application/x-javascript text/css application/xml text/javascript application/x-httpd-php image/jpeg image/gif image/png;
    gzip_vary on;

    server {
        listen       80;
        server_name  www.naste.top;

        location / {
            root   /xiaofei/xiaofei-blog/nginx/html/blog;
            index  index.html index.htm;
            try_files $uri $uri/ /index.html;
        }

	    location ^~ /api/ {
            proxy_pass http://xiaofei-blog:8080/;
	        proxy_set_header   Host             $host;
            proxy_set_header   X-Real-IP        $remote_addr;
            proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
        }

    }


    server {
        listen       80;
        server_name  blog.naste.top;

        location / {
            root   /xiaofei/xiaofei-blog/nginx/html/blog;
            index  index.html index.htm;
            try_files $uri $uri/ /index.html;
        }

	    location ^~ /api/ {
            proxy_pass http://xiaofei-blog:8080/;
	        proxy_set_header   Host             $host;
            proxy_set_header   X-Real-IP        $remote_addr;
            proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
        }

    }

    server {
        listen       80;
        server_name  admin.naste.top;

        location / {
            root   /xiaofei/xiaofei-blog/nginx/html/admin;
            index  index.html index.htm;
            try_files $uri $uri/ /index.html;
        }

	    location ^~ /api/ {
            proxy_pass http://xiaofei-blog:8080/;
	        proxy_set_header   Host             $host;
            proxy_set_header   X-Real-IP        $remote_addr;
            proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
        }

    }

 }

```

## 博客dockerfile文件

```yml
# 基础镜像
FROM  openjdk:8-jre
# author
MAINTAINER xiaofei

# 挂载目录
VOLUME /xiaofei/xiaofei-blog/xiaofei-blog/jar
# 创建目录
RUN mkdir -p /xiaofei/xiaofei-blog/xiaofei-blog/jar
# 指定路径
WORKDIR /xiaofei/xiaofei-blog/xiaofei-blog/jar
# 复制jar文件到路径
COPY ./jar/xiaofei-blog.jar /xiaofei/xiaofei-blog/xiaofei-blog/jar/xiaofei-blog.jar

EXPOSE 8080

# 启动文件服务
ENTRYPOINT ["java","-jar","/xiaofei/xiaofei-blog/xiaofei-blog/jar/xiaofei-blog.jar"]
```

## docker-compose配置文件

```yml
version: "3.8"

services:

  redis:
    container_name: redis
    image: redis:6.2
    restart: always
    ports:
      - "6379:6379"
    volumes:
      - ./redis/redis.conf:/etc/redis/redis.conf
      - ./redis/data:/data
    networks:
      - xiaofei-net
    # 根据自定义配置文件启动redis
    command: redis-server /etc/redis/redis.conf

  mysql:
    container_name: mysql
    image: mysql:8.0.19
    build:
      context: ./mysql
      dockerfile: dockerfile
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 'root'
      MYSQL_ALLOW_EMPTY_PASSWORD: 'no'
      MYSQL_DATABASE: 'xiaofei-blog'
      MYSQL_USER: 'xiaofei'
      MYSQL_PASSWORD: 'xiaofei'
    ports:
      - "3306:3306"
    volumes:
      - ./mysql/data:/var/lib/mysql
      - ./mysql/conf:/etc/mysql/conf.d
    networks:
      - xiaofei-net
    command:
      --character-set-server=utf8mb4
      --collation-server=utf8mb4_general_ci
      --default-authentication-plugin=mysql_native_password #解决外部无法访问

  rabbitmq:
    container_name: rabbit
    image: rabbitmq:3.9-management
    restart: always
    hostname: my-rabbit
    ports:
      - "15672:15672"
      - "5672:5672"
    networks:
      - xiaofei-net

  nginx:
    container_name: nginx
    image: nginx:1.22
    restart: always
    ports:
      - "80:80"
      - "81:81"
    volumes:
      - ./nginx/conf/nginx.conf:/etc/nginx/nginx.conf
      - ./nginx/html:/xiaofei/xiaofei-blog/nginx/html
    networks:
      - xiaofei-net

  # 一个一个的spring boot项目
  xiaofei-blog:
    container_name: xiaofei-blog
    image: xiaofei-blog:1.0
    restart: always
    build:
      context: ./xiaofei-blog
      dockerfile: dockerfile
    ports:
      - "8080:8080"
    networks:
      - xiaofei-net
    depends_on:
      - redis
      - mysql
      - rabbitmq
    links:
      - redis
      - mysql
      - rabbitmq
networks:
  xiaofei-net:

#  docker run -d -p 3306:3306 -v /xiaofei/xiaofei-blog/mysql/conf:/etc/mysql/conf.d -v /xiaofei/xiaofei-blog/mysql/data:/var/lib/mysql --restart=always   -e MYSQL_ROOT_PASSWORD="root" --name mysql mysql:8.0.19
#  docker run -d --hostname my-rabbit --name rabbit --restart=always -p 15672:15672 -p 5672:5672  rabbitmq:3.9-management
#  docker run -d -p 6379:6379 --restart=always --name docker-redis redis
#  docker run --name nginx --restart=always -p 80:80 -d -v /xiaofei/xiaofei-blog/nginx/conf/nginx.conf:/etc/nginx/nginx.conf -v /xiaofei/xiaofei-blog/xiaofei-blog-ui:/xiaofei/xiaofei-blog/xiaofei-blog-ui nginx
```

## 部署

![image-20220612142023878](https://cdn.jsdelivr.net/gh/xiao-i-fei/typora/imgs/image-20220612142023878.png)

> **项目放入上面图片中指定文件中，按照指定目录来存放，最后执行构建命令`docker-compose up -d`**
