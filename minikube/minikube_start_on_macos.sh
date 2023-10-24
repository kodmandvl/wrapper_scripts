# Script for run MiniKube on MacOS with Podman driver
# Attention! Before run minikube you must init and start podman machine.
# Init podman machine (example):
# podman machine init --cpus 3 --memory 6144 --rootful
# Set podman machine settings if it exists and you want to change parameters (example):
# podman machine set --cpus 3 --memory 6144 --rootful
# List podman machines:
# podman machine ls
# Start podman machine:
# podman machine start
# Examples:
# ./minikube_start_on_macos.sh minikube 3 5120m
# ./minikube_start_on_macos.sh myminikube 3 5120m
echo
echo "START $1 MINIKUBE CLUSTER (PROFILE) AFTER 5 SECONDS:"
echo
echo "minikube start -p $1 --kubernetes-version=v1.27.4 --driver=podman --container-runtime=cri-o --cpus=$2 --memory=$3"
echo
sleep 5
minikube start -p $1 --kubernetes-version=v1.27.4 --driver=podman --container-runtime=cri-o --cpus=$2 --memory=$3
echo
