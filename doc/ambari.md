## 安装ambari-server会提示需要哪些postgresql包

postgresql-server-9.2.24-4.el7_8.x86_64
postgresql-libs.x86_64 0:9.2.24-4.el7_8
postgresql.x86_64 0:9.2.24-4.el7_8

## postgresql RPM包下载

https://pkgs.org/download/postgresql-server  
http://mirrors.163.com/centos/7/os/x86_64/Packages/  

## mysql下载地址  

https://dev.mysql.com/downloads/  
使用版本：mysql-5.7.32-linux-glibc2.12-x86_64.tar.gz  
https://blog.csdn.net/yangjjuan/article/details/61615187  

## ambari部署说明

需要分别部署ambari-common、ambari-server、ambari-agent这三个role  

## 需要离线准备的包

ambari-agent-2.7.4.0-118.x86_64.rpm  
ambari-server-2.7.4.0-118.x86_64.rpm  
jce_policy-8.zip  
jdk-8u112-linux-x64.tar.gz  
mysql57-community-release-el7-8.noarch.rpm  
postgresql-9.2.24-4.el7_8.x86_64.rpm  
postgresql-libs-9.2.24-4.el7_8.x86_64.rpm  
postgresql-server-9.2.24-4.el7_8.x86_64.rpm  
perl-HTTP-Tiny-0.033-3.el7.noarch.rpm  
perl-Pod-Perldoc-3.20-4.el7.noarch.rpm  
perl-Encode-2.51-7.el7.x86_64.rpm  
perl-Pod-Usage-1.63-3.el7.noarch.rpm  
perl-Storable-2.45-3.el7.x86_64.rpm  
perl-constant-1.27-2.el7.noarch.rpm  
perl-Time-Local-1.2300-2.el7.noarch.rpm  
perl-Time-HiRes-1.9725-3.el7.x86_64.rpm  
perl-Scalar-List-Utils-1.27-248.el7.x86_64.rpm  
perl-File-Temp-0.23.01-3.el7.noarch.rpm  
perl-threads-shared-1.43-6.el7.x86_64.rpm  
perl-Filter-1.49-3.el7.x86_64.rpm  
perl-Getopt-Long-2.40-3.el7.noarch.rpm  
perl-parent-0.225-244.el7.noarch.rpm  
perl-podlators-2.5.1-3.el7.noarch.rpm  
perl-Pod-Escapes-1.04-297.el7.noarch.rpm  
perl-Text-ParseWords-3.29-4.el7.noarch.rpm  
perl-libs-5.16.3-297.el7.x86_64.rpm  
perl-Exporter-5.68-3.el7.noarch.rpm  
perl-Socket-2.010-5.el7.x86_64.rpm  
perl-Carp-1.26-244.el7.noarch.rpm  
perl-PathTools-3.40-5.el7.x86_64.rpm  
perl-Pod-Simple-3.28-4.el7.noarch.rpm  
perl-File-Path-2.09-2.el7.noarch.rpm  
perl-threads-1.87-4.el7.x86_64.rpm  
perl-macros-5.16.3-297.el7.x86_64.rpm  
perl-5.16.3-297.el7.x86_64.rpm  

## yum转rpm安装需要特别注意

yum会把一些依赖自动下载，而rpm则不会，故会多出来一些需要安装的包，如openssl等  