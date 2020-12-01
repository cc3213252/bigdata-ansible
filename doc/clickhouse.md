## 启动服务

依赖zookeeper，需要先启动

## 集群安装注意事项

tgz方式安装时，如果先解压缩好，会有软链接无法拷贝问题，必须在虚拟机内部解压  

## 服务起不来时定位问题

sudo -u clickhouse clickhouse-server --config-file=/etc/clickhouse-server/config.xml