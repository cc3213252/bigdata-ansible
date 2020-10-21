# 开发devops

一套最适合公司内网下的，最适合开发ansible脚本的devops

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

# 初始化hadoop

ansible-playbook --tags=startjn opt/hadoop.yml  
ansible-playbook --tags=formatnn opt/hadoop.yml  
ansible-playbook --tags=startnn opt/hadoop.yml  
ansible-playbook --tags=syncnn opt/hadoop.yml  
ansible-playbook --tags=startsnn opt/hadoop.yml  
ansible-playbook --tags=status opt/hadoop.yml  
ansible-playbook --tags=formatzkfc opt/hadoop.yml  

# 部署计划

## hadoop

| 主机名  | nn   | zk   | dn   | zfkc | jn   |
| ------ | ---- | ---- | ---- | ---- | ---- |
| node1  | Y    | Y    |      | Y    | Y    |
| node2  | Y    | Y    |  Y   | Y    | Y    |
| node3  |      | Y    |  Y   |      | Y    |

## storm

| 主机名  | nimbus | zk   | supervisor |
| ------ | ----   | ---- | ----       | 
| node1  | Y      | Y    |            | 
| node2  |        | Y    |  Y         | 
| node3  |        | Y    |  Y         | 