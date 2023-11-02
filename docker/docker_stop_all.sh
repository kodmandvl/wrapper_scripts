#!/bin/sh
# Script for stop all containers
# Example:
# ./docker_stop_all.sh
echo "ALL CONTAINERS: `docker ps -a | grep -v ^CONTAINER | wc -l`"
echo "RUNNING CONTAINERS: `docker ps | grep -v ^CONTAINER | wc -l`"
echo "DOCKER STOP ALL RUNNING CONTAINERS..."
docker stop `docker ps | grep -v ^CONTAINER | awk '{ print $1 }'`
sleep 5
echo "ALL CONTAINERS: `docker ps -a | grep -v ^CONTAINER | wc -l`"
echo "RUNNING CONTAINERS: `docker ps | grep -v ^CONTAINER | wc -l`"
echo DONE.
