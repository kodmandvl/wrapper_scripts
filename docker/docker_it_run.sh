#!/bin/sh
# Script for run docker container interactive with pseudo-TTY.
# 1st argument (mandatory): docker image (and tag if needed)
# 2nd argument (mandatory): container name
# 3rd argument (if needed): other docker run command options enclosed in quotes or double quotes
# 4th argument (if needed): command with arguments for run in container enclosed in quotes or double quotes
# Examples:
# ./docker_it_run.sh rockylinux:8.8 myrocky88 "-u root:root -w /root -p 8088:80 -p 5488:5432 -p 1588:1521 -v ${HOME}/temp/share/myrocky88:/share"
# ./docker_it_run.sh debian:11 mydebian11 "-u root:root -w /root -p 8011:80 -p 5411:5432 -v ${HOME}/temp/share/mydebian11:/share"
# ./docker_it_run.sh debian:12 mydebian12 "-u root:root -w /root -p 8012:80 -p 5412:5432 -v ${HOME}/temp/share/mydebian12:/share"
# ./docker_it_run.sh alt:p8 myaltp8 "-u root:root -w /root -p 8008:80 -p 5408:5432 -v ${HOME}/temp/share/myaltp8:/share"
# ./docker_it_run.sh rockylinux:8.8 rocky88
# ./docker_it_run.sh debian:11 debian11
# ./docker_it_run.sh debian:12 debian12
# ./docker_it_run.sh fedora:38 fedora38
# ./docker_it_run.sh centos:centos7.9.2009 centos7
# ./docker_it_run.sh alt:p8 altp8
# ./docker_it_run.sh rockylinux:8.8 rl60 "-u root:root -w /root" "sleep 60"
# ./docker_it_run.sh rockylinux:8.8 rl60 "" "sleep 60"
# ./docker_it_run.sh rockylinux:8.8 tempcon "" "cat -n /etc/os-release"
# ./docker_it_run.sh rockylinux:8.8 tempcon "" "hostname -i"
# ./docker_it_run.sh rockylinux:8.8 tempcon "" "/bin/sh"
v_image=$1
v_name=$2
v_others=$3
v_command=$4
if [ -z "$v_image" ]; then
  echo "DOCKER IMAGE IS NOT SET! EXIT!"
  exit 1
fi
if [ -z "$v_name" ]; then
  echo "CONTAINER NAME IS NOT SET! EXIT!"
  exit 2
fi
echo "DOCKER RUN:"
if [ -z "$v_others" ]; then
  echo "docker run -it --name ${v_name} -h ${v_name} ${v_image} ${v_command}"
  docker run -it --name ${v_name} -h ${v_name} ${v_image} ${v_command}
else
  echo "docker run -it --name ${v_name} -h ${v_name} ${v_others} ${v_image} ${v_command}"
  docker run -it --name ${v_name} -h ${v_name} ${v_others} ${v_image} ${v_command}
fi
echo DONE.
