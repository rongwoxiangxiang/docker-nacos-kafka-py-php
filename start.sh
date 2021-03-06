#!/bin/bash

if [ ! -d "nacos" ];then
  mkdir ./nacos
  git clone https://github.com/nacos-group/nacos-docker.git ./nacos 
elif [ ! -f "nacos/example/standalone-mysql-5.7.yaml" ];then
  git clone https://github.com/nacos-group/nacos-docker.git ./nacos
fi

declare -a services
echo "start stopping all docker services"
if [ x"$1" == x"stop" ];then
  services=`docker ps | awk 'NR <= 2 {next} {print $1}'`
  if [ ${#services} != 0 ];then
    docker ps -qa | xargs docker rm -f
  fi
  echo "stopped all docker services "
  exit 0
fi


if [ x"$1" == x"nacos" ];then
  docker_ymal_file="nacos/example/standalone-mysql-5.7.yaml"
elif [ x"$1" == x"kafka" -o x"$1" == x"kfk" ];then
  docker_ymal_file="kafka/standalone-kafka.yaml"
elif [ x"$1" == x"mysql" ];then
  docker_ymal_file="mysql/docker-compose.yaml"
elif [ x"$1" == x"redis" ];then
  docker_ymal_file="redis/docker-compose.yml"
elif [ x"$1" == x"python27" ];then
  docker_ymal_file="python/docker-compose-py-2.7.yml"
elif [ x"$1" == x"php" ];then
  docker_ymal_file="php/docker-compose.yml"
elif [ x"$1" == x"php56" ];then
  docker_ymal_file="php/docker-compose56.yml"
fi

services=(
  `docker-compose -f "$docker_ymal_file" ps | awk 'NR <= 2 {next} {print $1}'`
)
if [ x"$2" == x"stop" ];then
  if [ ${#services} == 0 ];then
    echo "stopped"
    exit 0
  fi
  echo "stop..."
  docker-compose  -f "$docker_ymal_file" down
  exit 0
elif [ x"$2" == x"restart" ];then
  if [ ${#services} == 0 ];then
    echo "please start first"
    exit 0
  fi
  echo "restart..."
  docker-compose  -f "$docker_ymal_file" restart
  exit 0
fi

if [ ${#services[@]} -eq 0 ];then
  echo "start with conf: "$docker_ymal_file" "
  docker-compose -f "$docker_ymal_file" up -d
  #services=`docker-compose ps | awk 'NR <= 2 {next} {print $1}'`
fi

echo "working service: ${services[*]}" 