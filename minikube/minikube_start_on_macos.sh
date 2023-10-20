# Script for run minikube on MacOS with Podman driver
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
