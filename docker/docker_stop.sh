#!/bin/sh
# Script for stop running docker conatainer.
# 1st argument (mandatory): container name (or container id)
# Examples:
# ./docker_stopt.sh ngnx
# ./docker_stop.sh 4021e948b84c
v_name=$1
if [ -z "$v_name" ]; then
  echo "CONTAINER NAME (OR CONTAINER ID) IS NOT SET! EXIT!"
  exit 1
fi
docker stop ${v_name}
echo DONE.
