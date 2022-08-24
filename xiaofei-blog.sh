#!/bin/bash

# 获取打包后jar包名字
projectName=`cat pom.xml | grep finalName | cut -d ">" -f 2 | cut -d "<" -f 1`.jar

# 执行清理和构建命令
mvn clean package

# 将jar包移动到docker目录中
cp ./target/xiaofei-blog.jar ./docker/xiaofei-blog/jar/xiaofei-blog.jar