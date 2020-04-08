## docker-nacos-kafka

### [nacos](https://nacos.io/zh-cn/docs/quick-start-docker.html)
./start.sh nacos

默认nacos服务包含mysql5.6（可以修改为8.0），占用3306端口，root账户密码root

如果不需要mysql服务，可以使用derby，或者手动修改容器内mysql地址为实际地址

使用derby需要修改start.sh将 standalone-mysql-5.7.yaml 修改为 standalone-derby.yaml

### [kafka](https://hub.docker.com/r/wurstmeister/zookeeper)
./start.sh kafka

### python
#### python3:
./start.sh python
#### python2.7:
./start.sh python27

### redis
python为python2.7 仅在基础镜像之上安装了mysql-python
./start.sh redis

**关闭服务**
./start.sh [nacos|python|python27|kafka|redis|php|php56] stop
