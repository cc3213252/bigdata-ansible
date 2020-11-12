## 集群启动

ansible-playbook --tags=start opt/hbase.yml  

之后需要：
vagrant ssh host1  
hbase-daemon.sh start master  

## 测试

host1:16010  
host2:16010  
