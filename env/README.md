## 说明

搭建大数据集群时，需要搭配不同的组件，分配不同的机器和资源，这里就是配置好的一些解决方案

## 使用

```bash
cd kafka-flink-clickhouse
mv ../../tools .
vagrant up
```

## 操作服务

ansible-playbook --tags=status ../../opt/zookeeper.yml
  
## 问题

centos下无法用ruby库getoptlong