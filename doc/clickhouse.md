## 启动服务

依赖zookeeper，需要先启动

## 集群安装注意事项

tgz方式安装时，如果先解压缩好，会有软链接无法拷贝问题，必须在虚拟机内部解压  

## 服务起不来时定位问题

sudo -u clickhouse clickhouse-server --config-file=/etc/clickhouse-server/config.xml

## 设置用户名密码

```bash
PASSWORD=$(base64 < /dev/urandom | head -c8); echo "$PASSWORD"; 
echo -n "$PASSWORD" | sha256sum | tr -d '-'
```
得到密码明文：bsOPKgLp  
密码密文：91bce29e16c1046e7e21229439944c3a95539edc05b446ceef2b969658eb9863

## 测试

clickhouse-client --password bsOPKgLp
```sql
select * from system.clusters;
```

## 客户端工具

http://ui.tabix.io/#!/sql  
注意这个工具sql不需要分号  