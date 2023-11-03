#!/bin/sh
# Script for run docker container in background.
# 1st argument (mandatory): docker image (and tag if needed)
# 2nd argument (mandatory): container name
# 3rd argument (if needed): other docker run command options enclosed in quotes or double quotes
# 4th argument (if needed): command with arguments for run in container enclosed in quotes or double quotes
# Examples:
# ./docker_run.sh postgres:13.12-alpine3.18 mypg13 "-p 5432:5432 -v ${HOME}/temp/mypg13:/var/lib/postgresql/data -e POSTGRES_PASSWORD=${PGPASSWORD} -v ${HOME}/temp/share/mypg13:/share"
# ./docker_run.sh postgres:16 pg16 "-p 5416:5432 -v ${HOME}/temp/pg16:/var/lib/postgresql/data -e POSTGRES_PASSWORD=${PGPASSWORD}"
# ./docker_run.sh postgres:15 pg15 "-p 5415:5432 -v ${HOME}/temp/pg15:/var/lib/postgresql/data -e POSTGRES_PASSWORD=${PGPASSWORD}"
# ./docker_run.sh postgres:14 pg14 "-p 5414:5432 -v ${HOME}/temp/pg14:/var/lib/postgresql/data -e POSTGRES_PASSWORD=${PGPASSWORD}"
# ./docker_run.sh postgres:13 pg13 "-p 5413:5432 -v ${HOME}/temp/pg13:/var/lib/postgresql/data -e POSTGRES_PASSWORD=${PGPASSWORD}"
# ./docker_run.sh postgres:13.12-alpine3.18 pg5433 '-p 5433:5432 -e POSTGRES_PASSWORD=mypass'
# ./docker_run.sh kodmandvl/mynginx:v4 myngnx "-p 8080:8080 -v ${HOME}/temp/myngnx:/ngnx/html"
# ./docker_run.sh nginx:1.25.2-alpine-slim ngnx '-p 8000:80 -p 8888:80'
# ./docker_run.sh rockylinux:8.8 rl60 "" "sleep 60"
# ./docker_run.sh nginx ngnx
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
  echo "docker run -d --name ${v_name} -h ${v_name} ${v_image} ${v_command}"
  docker run -d --name ${v_name} -h ${v_name} ${v_image} ${v_command}
else
  echo "docker run -d --name ${v_name} -h ${v_name} ${v_others} ${v_image} ${v_command}"
  docker run -d --name ${v_name} -h ${v_name} ${v_others} ${v_image} ${v_command}
fi
echo DONE.
