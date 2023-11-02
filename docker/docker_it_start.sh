#!/bin/sh
# Script for start existing docker conatainer interactive.
# 1st argument (mandatory): container name (or container id)
# Examples:
# ./docker_it_start.sh rl88
# ./docker_it_start.sh f482ed766630
v_name=$1
if [ -z "$v_name" ]; then
  echo "CONTAINER NAME (OR CONTAINER ID) IS NOT SET! EXIT!"
  exit 1
fi
docker start -ai ${v_name}
echo DONE.
