## 工程说明

hadoop也是ha架构，不过ha是手动实现的  
hadoop-ha是借助zookeeper，增加了故障转移服务，自动ha  
两个工程只有hdfs-site.xml不一样  

## hadoop脚本注意事项

namenode节点格式化这个步骤目前只能手动执行，执行完成后可以用ansible脚本统一启动和停止，但是不能分开去启动  

yarn节点目前resourcemanager、必须手动启动，但可以用脚本停止

## namenode节点初始化步骤

1、分别登陆各个节点，启动journalnode  
hadoop-daemon.sh start journalnode  

2、登陆host1，格式化主namenode，并启动  
hdfs namenode -format  
hadoop-daemon.sh start namenode  

3、登陆host2，同步副namenode  
hdfs namenode -bootstrapStandby  

4、【hadoop-ha】登陆host1，格式化zkfc  
hdfs zkfc -formatZK  
检查zk多了一个路径：  
bin/zkCli.sh  
ls /  多了一个hadoop-ha  

至此，可以开始使用脚本ansible-playbook --tags=stop/start opt/hadoop.yml启动了  

## 激活namenode

以上手动启动后，两个namenode都是standby状态，需要激活，登陆host1    
hdfs haadmin -transitionToActive nn1  

## yarn启动命令

ansible-playbook --tags=startyn opt/hadoop.yml  

vagrant ssh host1  
yarn --daemon start resourcemanager      
mapred --daemon start historyserver  


## 测试

namenode:  
host1:50070  
host2:50070  

resource-manager:  
host1:8088  

job-history:  
host1:19888  