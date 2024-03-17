# 博客介绍


<p align=center>
   基于Springboot + Vue 开发的前后端分离博客
</p>
[在线地址](#在线地址) | [项目特点](#项目特点) | [技术介绍](#技术介绍) | [运行环境](#运行环境) | [开发环境](#开发环境) | [项目部署](#项目部署)

## 在线地址

**项目链接：** [http://106.53.208.88:8000/](http://106.53.208.88:8000/)

**后台链接：** [http://106.53.208.88:8100/](http://106.53.208.88:8100/)

测试账号：test123，密码：test123，可登入后台查看。

## 项目特点

- 前台参考"Hexo"的"Butterfly"设计，美观简洁，响应式体验好。
- 后台参考"element-admin"设计，侧边栏，历史标签，面包屑自动生成。
- 采用Markdown编辑器，写法简单。
- 评论支持表情输入回复等，样式参考Valine。
- 添加音乐播放器，支持在线搜索歌曲。
- 前后端分离部署，适应当前潮流。
- 接入第三方登录，减少注册成本。
- 支持发布说说，随时分享趣事。
- 留言采用弹幕墙，更加炫酷。
- 支持代码高亮和复制，图片预览，深色模式等功能，提升用户体验。
- 搜索文章支持高亮分词，响应速度快。
- 新增文章目录、推荐文章等功能，优化用户体验。
- 新增在线聊天室，支持撤回、语音输入、统计未读数量等功能。
- 新增aop注解实现日志管理。  
- 支持动态权限修改，采用RBAC模型，前端菜单和后台权限实时更新。
- 后台管理支持修改背景图片，博客配置等信息，操作简单，支持上传相册。
- 代码支持多种搜索模式（Elasticsearch或MYSQL），支持多种上传模式（OSS或本地），可支持配置。
- 代码遵循阿里巴巴开发规范，利于开发者学习。

## 技术介绍

**前端：** vue + vuex + vue-router + axios + vuetify + element + echarts

**后端：** SpringBoot + nginx + docker + SpringSecurity + Swagger2 + MyBatisPlus + Mysql + Redis + elasticsearch + RabbitMQ + Websocket

**其他：** 接入QQ，微博第三方登录

## 运行环境

**服务器：** 腾讯云1核2G CentOS7.6

**对象存储：** 阿里云OSS

**最低配置：** 1核2G服务器（关闭ElasticSearch）

## 开发环境

| 开发工具                      | 说明              |
| ----------------------------- | ----------------- |
| IDEA                          | Java开发工具IDE   |
| VSCode                        | Vue开发工具IDE    |
| Navicat                       | MySQL远程连接工具 |
| Another Redis Desktop Manager | Redis远程连接工具 |
| X-shell                       | Linux远程连接工具 |
| Xftp                          | Linux文件上传工具 |

| 开发环境      | 版本   |
| ------------- | ------ |
| JDK           | 1.8    |
| MySQL         | 8.0.20 |
| Redis         | 6.0.5  |
| Elasticsearch | 7.9.2  |
| RabbitMQ      | 3.8.5  |



## 项目部署

### MySQL的dockerfile文件

```yml
# 基础镜像
FROM mysql:8.0.19
# author
MAINTAINER xiaofei

# 执行sql脚本
ADD ./db/*.sql /docker-entrypoint-initdb.d/
```

### nginx配置文件

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
        server_name  127.0.0.1;

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
        listen       81;
        server_name  127.0.0.1;

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
        listen       82;
        server_name  127.0.0.1;

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

### 博客dockerfile文件

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

### docker-compose配置文件

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
      - "82:82"
    volumes:
      - ./nginx/conf/nginx.conf:/etc/nginx/nginx.conf
      - ./nginx/html:/xiaofei/xiaofei-blog/nginx/html
    networks:
      - xiaofei-net

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
```
