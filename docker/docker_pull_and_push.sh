#!/bin/bash

# Script for pull images and push them to other container registry.
# 1st argument: source container registry (if it is "-" or empty then "docker.io" by default)
# 2nd argument: source path to image (if is is "-" or empty then "library" by default)
# 3rd argument: source image name and (if needed) tag (if it is "-" or empty then "hello-world" by default)
# 4th argument: target container registry (if is is "-" or empty then "127.0.0.1:5000" by default)
# 5th argument: target path to image (if is is "-" or empty then it is the same as the source path to image)
# 6th argument: target image name and (if needed) tag (if is is "-" or empty then it is the same as the source image name)
# Attention! Before run this script you should login on target conatiner registry and (if needed) on source container registry!
# Examples:
# ./docker_pull_and_push.sh
# ./docker_pull_and_push.sh - - - - - -
# ./docker_pull_and_push.sh - - alpine:3.18 - - alpine:3.18
# ./docker_pull_and_push.sh - - alpine:3.18

#echo

ARG1=$1
if [[ "${ARG1}" == "-" || "${ARG1}" == "" ]]; then
 v_source_cr=docker.io
else
 v_source_cr=${ARG1}
fi
#echo "Source container registry: $v_source_cr"

ARG2=$2
if [[ "${ARG2}" == "-" || "${ARG2}" == "" ]]; then
 v_source_path=library
else
 v_source_path=${ARG2}
fi
#echo "Source path to image: $v_source_path"

ARG3=$3
if [[ "${ARG3}" == "-" || "${ARG3}" == "" ]]; then
 v_source_image=hello-world
else
 v_source_image=${ARG3}
fi
#echo "Source image name: $v_source_image"

ARG4=$4
if [[ "${ARG4}" == "-" || "${ARG4}" == "" ]]; then
 v_target_cr=127.0.0.1:5000
else
 v_target_cr=${ARG4}
fi
#echo "Target container registry: $v_target_cr"

ARG5=$5
if [[ "${ARG5}" == "-" || "${ARG5}" == "" ]]; then
 v_target_path=${v_source_path}
else
 v_target_path=${ARG5}
fi
#echo "Target path to image: $v_target_path"

ARG6=$6
if [[ "${ARG6}" == "-" || "${ARG6}" == "" ]]; then
 v_target_image=${v_source_image}
else
 v_target_image=${ARG6}
fi
#echo "Target image name: $v_target_image"

echo
echo "Pull ${v_source_cr}/${v_source_path}/${v_source_image} image and push it to ${v_target_cr}/${v_target_path}/${v_target_image}:"
echo

docker pull ${v_source_cr}/${v_source_path}/${v_source_image} && echo PULLED && \
docker tag ${v_source_cr}/${v_source_path}/${v_source_image} ${v_target_cr}/${v_target_path}/${v_target_image} && echo TAGGED && \
docker push ${v_target_cr}/${v_target_path}/${v_target_image} && echo PUSHED && \
docker pull ${v_target_cr}/${v_target_path}/${v_target_image} && echo CHECK_PULL_FROM_TARGET_CONTAINER_REGISTRY_OK && echo OK

echo
echo DONE.
echo