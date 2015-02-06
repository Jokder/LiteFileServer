# LiteFileServer
使用Google Dart构建的轻量级、简单的文件下载服务器。
不需要安装nginx/apache，占用更少的资源。

1.安装dart sdk

请参考：[这里](https://www.dartlang.org/tools/download-editor.html?utm_expid=51752263-1.WpTWnsvDTEGD1RYXp5u58g.1&utm_referrer=https%3A%2F%2Fwww.dartlang.org%2Ftools%2Fsdk%2F "dark sdk")

2.添加pub到环境变量

    export PATH=$PATH:/usr/lib/dart/bin

3.获取项目

    git clone https://github.com/Jokder/LiteFileServer.git

4.配置

配置文件是LiteFileServer/conf.json

    {
    "version": "0.0.1",
    "port":8082,      #端口号
    "root":"web"      #站点根目录
    }

文件列表从站点根目录下的files目录中读取。

5.运行

    cd LiteFileServer
    pub install
    nohup dart main.dart >/dev/null 2>&1 &
