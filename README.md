## docker-nacos-kafka

### [nacos](https://nacos.io/zh-cn/docs/quick-start-docker.html)
./start.sh nacos

默认nacos服务包含mysql5.6（可以修改为8.0），占用3306端口，root账户密码root

如果不需要mysql服务，可以使用derby，或者手动修改容器内mysql地址为实际地址

使用derby需要修改start.sh将 standalone-mysql-5.7.yaml 修改为 standalone-derby.yaml


### php
**Php 服务默认包含nginx**
#### [php(with swoole)](https://www.easyswoole.com/):
./start.sh php
#### php56:
./start.sh php56

### [kafka](https://hub.docker.com/r/wurstmeister/zookeeper)
./start.sh kafka

### python
python为python2.7 仅在基础镜像之上安装了mysql-python

没有加入启动脚本，手动启动：
1. *docker run -it registry.cn-hangzhou.aliyuncs.com/chs/python2.7:mysql-python bash*
2. *docker-compose -f path/docker-compose-py-2.7.yml up -d*ty
