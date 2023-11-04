#!/bin/sh
# Script for remove images (force)
# 1st argument: template for search, default: none (when repository or tag is none)
# Examples:
# ./docker_rmi.sh .*
# ./docker_rmi.sh someimage
# ./docker_rmi.sh
v_template=$1
if [ -z "$v_template" ]; then
  v_template="none"
fi
echo "IMAGES FOR REMOVE: `docker images | grep $v_template | wc -l`"
echo "`docker images | grep $v_template`"
echo "DOCKER REMOVE IMAGES (FORCE) AFTER 5 SECONDS..."
sleep 5
docker rmi -f `docker images | grep $v_template | awk '{ print $3 }'`
echo "IMAGES FOR REMOVE: `docker images | grep $v_template | wc -l`"
echo DONE.
