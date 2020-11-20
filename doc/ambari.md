## 安装ambari-server会提示需要哪些postgresql包

postgresql-server-9.2.24-4.el7_8.x86_64
postgresql-libs.x86_64 0:9.2.24-4.el7_8
postgresql.x86_64 0:9.2.24-4.el7_8

## postgresql RPM包下载

https://pkgs.org/download/postgresql-server

## ambari部署说明

需要分别部署ambari-common、ambari-server、ambari-agent这三个role  
目前已经实现了准离线安装，还需短时间网络安装的包如下：  
（ntp、epel-release、openssl、mysql-community-server、mysql-connector-java*）

## 需要离线准备的包

ambari-agent-2.7.4.0-118.x86_64.rpm  
ambari-server-2.7.4.0-118.x86_64.rpm  
jce_policy-8.zip  
jdk-8u112-linux-x64.tar.gz  
mysql57-community-release-el7-8.noarch.rpm  
postgresql-9.2.24-4.el7_8.x86_64.rpm  
postgresql-libs-9.2.24-4.el7_8.x86_64.rpm  
postgresql-server-9.2.24-4.el7_8.x86_64.rpm  

## yum转rpm安装需要特别注意

yum会把一些依赖自动下载，而rpm则不会，故会多出来一些需要安装的包，如openssl等  