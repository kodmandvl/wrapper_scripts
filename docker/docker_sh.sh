#!/bin/sh
# Script for interactive exec /bin/sh on running docker container.
# 1st argument (mandatory): container name (or container id)
# Examples:
# ./docker_sh.sh ngnx
# ./docker_sh.sh 4021e948b84c
v_name=$1
if [ -z "$v_name" ]; then
  echo "CONTAINER NAME (OR CONTAINER ID) IS NOT SET! EXIT!"
  exit 1
fi
docker exec -it ${v_name} /bin/sh
echo DONE.
