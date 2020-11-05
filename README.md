# 大数据devops脚本

一套最适合公司内网下的，最适合开发ansible脚本的devops  

我们搞大数据开发，多数是集群环境，有大量的配置，有时一个环境问题花费大量时间排查，为了提升效率，开发了这套脚本。 
 
这套脚本安装一个3台机器的zookeeper、kafka、storm、hadoop集群，从无到有都只需要4分钟，而且脚本极其简单。  

# 开发规则

充分利用"约定大于配置"使脚本简化，系统hostname命名，相互无密访问，甚至用户名等都是vagrant实现的，约定自动脚本只实现安装，服务启动用手动脚本，使用脚本前，都要自己从网上下载好需要安装的安装包，并解压到tools目录下面。

# 需要安装的工具

vagrant  
vagrant-hostmanager  

# 使用说明

1、默认在tools目录下下载好、解压、并重命名为jdk、zookeeper、hadoop  
2、配置Vagrantfile中host  
3、配置install/inventory/hosts  
4、vagrant up  

# 脚本说明

默认全部安装，vagrant相关的脚本只完成安装  
使用vagrant reload或者vagrant halt，下次启动会还原成一个干净的系统，不想还原请用vagrant suspend/resume

# 服务操作

ansible-playbook --tags=start/restart/stop/status opt/zookeeper.yml  
ansible-playbook --tags=start/restart/stop/status opt/hadoop.yml  
ansible-playbook --tags=start/stop/status opt/storm.yml  
ansible-playbook --tags=start/stop/status opt/kafka.yml 

# 初始化hadoop

ansible-playbook --tags=startjn opt/hadoop.yml  
ansible-playbook --tags=formatnn opt/hadoop.yml  
ansible-playbook --tags=startnn opt/hadoop.yml  
ansible-playbook --tags=syncnn opt/hadoop.yml  
ansible-playbook --tags=startsnn opt/hadoop.yml  
ansible-playbook --tags=status opt/hadoop.yml 

# 初始化hadoop-ha

ansible-playbook --tags=startjn opt/hadoop-ha.yml  
ansible-playbook --tags=formatnn opt/hadoop-ha.yml  
ansible-playbook --tags=startnn opt/hadoop-ha.yml  
ansible-playbook --tags=syncnn opt/hadoop-ha.yml  
ansible-playbook --tags=startsnn opt/hadoop-ha.yml  
ansible-playbook --tags=status opt/hadoop-ha.yml  
ansible-playbook --tags=formatzkfc opt/hadoop-ha.yml  

# 脚本测试

ansible-playbook install/dev/testplay.yml  

# 部署计划

## hadoop

| 主机名  | nn   | rm   | dn   | nm   | jn   | web-proxy | 
| ------ | ---- | ---- | ---- | ---- | ---- | ----      |
| host1  | Y    | Y    |      |      | Y    |  Y        |
| host2  | Y    |      |  Y   | Y    | Y    |           |
| host3  |      |      |  Y   | Y    | Y    |           |

## hadoop-ha

| 主机名  | nn   | zk   | dn   | zfkc | jn   |
| ------ | ---- | ---- | ---- | ---- | ---- |
| host1  | Y    | Y    |      | Y    | Y    |
| host2  | Y    | Y    |  Y   | Y    | Y    |
| host3  |      | Y    |  Y   |      | Y    |

## storm

| 主机名  | nimbus | zk   | supervisor | storm ui |
| ------ | ----   | ---- | ----       | ----     |
| host1  | Y      | Y    |            |   Y      |
| host2  |        | Y    |  Y         |          |
| host3  |        | Y    |  Y         |          |

## kafka

| 主机名  | kafka  | zk   | 
| ------ | ----   | ---- | 
| host1  | Y      | Y    | 
| host2  | Y      | Y    | 
| host3  | Y      | Y    | 

## 遗留问题

无法脚本启动journalnode、namenode，可以手动启动，可以脚本停止    
格式化zkfc报错  

hadoop初始化过程中无法通过脚本启动服务，初始化完成后，可以通过start/stop-dfs.sh启停服务   