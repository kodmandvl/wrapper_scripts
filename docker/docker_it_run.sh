#!/bin/sh
# Script for run docker container interactive with pseudo-TTY.
# 1st argument (mandatory): docker image (and tag if needed)
# 2nd argument (mandatory): container name
# 3rd argument (if needed): other docker run command options enclosed in quotes or double quotes
# 4th argument (if needed): command with arguments for run in container enclosed in quotes or double quotes
# Examples:
# ./docker_it_run.sh rockylinux:8.8 rl88 "-u root:root -w /root"
# ./docker_it_run.sh debian:11 deb11 "-u root:root -w /root"
# ./docker_it_run.sh rockylinux:8.8 rockylinux88
# ./docker_it_run.sh debian:11 debian11
# ./docker_it_run.sh debian:12 debian12
# ./docker_it_run.sh fedora:38 fedora38
# ./docker_it_run.sh centos:centos7.9.2009 centos7
# ./docker_it_run.sh rockylinux:8.8 rl60 "-u root:root -w /root" "sleep 60"
# ./docker_it_run.sh rockylinux:8.8 rl60 "" "sleep 60"
# ./docker_it_run.sh rockylinux:8.8 tempcon "" "cat -n /etc/os-release"
# ./docker_it_run.sh rockylinux:8.8 tempcon "" "hostname -i"
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
