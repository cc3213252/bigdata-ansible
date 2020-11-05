## hadoop脚本注意事项

namenode节点格式化这个步骤目前只能手动执行，执行完成后可以用ansible脚本统一启动和停止，但是不能分开去启动  

yarn节点目前必须手动启动，但可以用脚本停止

## namenode节点初始化步骤

1、分别登陆各个节点，启动journalnode  
hadoop-daemon.sh start journalnode  

2、登陆host1，格式化主namenode，并启动  
hdfs namenode -format  
hadoop-daemon.sh start namenode  

3、登陆host2，同步副namenode  
hdfs namenode -bootstrapStandby  

至此，可以开始使用脚本ansible-playbook --tags=stop/start opt/hadoop.yml启动了  

## 激活namenode

以上手动启动后，两个namenode都是standby状态，需要激活，登陆host1    
hdfs haadmin -transitionToActive nn1  

## yarn启动命令

vagrant ssh host1  
yarn --daemon start resourcemanager    
yarn --daemon start proxyserver  
mapred --daemon start historyserver  

分别登陆host2、host3  
yarn --daemon start nodemanager


## 测试

namenode:  
host1:50070  
host2:50070  

resource-manager:  
host1:8088  

job-history:  
host1:19888  