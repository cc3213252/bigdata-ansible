# standalone模式

集群启动:  
不需要hadoop  
vagrant ssh host1  
start-cluster.sh  

测试:  
host1:8081

# yarn模式

集群启动：  
先启动hadoop集群，并激活namenode  

vagrant ssh host1  
export HADOOP_CLASSPATH=`hadoop classpath`  
nohup yarn-session.sh -n 2 -s 1 -jm 100 -tm 100 -nm test  > yarn-session.log &  
-n taskmanager数量  
-s 每个taskmanager的slot数量  
-jm jobmanager内存    
-tm taskmanager内存   
-nm yarn的appName  
-d 分离运行，即前端运行    

测试：  
查看hadoop resource manager: host1:8088  
查看flink： host2:8081  

wordcount测试：  
vagrant ssh host2  
flink run -m yarn-cluster /vagrant/tools/flink/examples/batch/WordCount.jar     
-m 指定master  