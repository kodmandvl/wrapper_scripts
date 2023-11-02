#!/bin/sh
# Script for remove docker conatainer (force).
# 1st argument (mandatory): container name or container id
# Examples:
# ./docker_rm.sh ngnx
# ./docker_rm.sh e72dc41de382
v_name=$1
if [ -z "$v_name" ]; then
  echo "CONTAINER NAME (OR CONTAINER ID) IS NOT SET! EXIT!"
  exit 1
fi
echo "DOCKER REMOVE $v_name CONTAINER..."
docker rm -f ${v_name}
echo DONE.
