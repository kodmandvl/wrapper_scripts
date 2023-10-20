# Script for run minikube
# Examples:
# For cluster with minikube-docker profile name on physical host with 8CPUs and 16GB RAM:
# ./minikube_start.sh minikube-docker docker 4 8192m
# For cluster with minikube-virtualbox profile name on physical host with 8CPUs and 16GB RAM:
# ./minikube_start.sh minikube-virtualbox virtualbox 4 8192m
# For cluster with default profile name (minikube) on physical host with 8CPUs and 16GB RAM: 
# ./minikube_start.sh minikube docker 4 8192m
# ./minikube_start.sh minikube virtualbox 4 8192m
# For cluster with minikube-docker profile name on physical host with 4CPUs and 8GB RAM:
# ./minikube_start.sh minikube-docker docker 2 4096m
# For cluster with minikube-virtualbox profile name on physical host with 4CPUs and 8GB RAM:
# ./minikube_start.sh minikube-virtualbox virtualbox 2 4096m
# For cluster with default profile name (minikube) on physical host with 4CPUs and 8GB RAM: 
# ./minikube_start.sh minikube docker 2 4096m
# ./minikube_start.sh minikube virtualbox 2 4096m
echo
echo "START $1 MINIKUBE CLUSTER (PROFILE) AFTER 5 SECONDS:"
echo
echo "minikube start -p $1 --kubernetes-version=v1.27.4 --driver=$2 --cpus=$3 --memory=$4"
echo
sleep 5
minikube start -p $1 --kubernetes-version=v1.27.4 --driver=$2 --cpus=$3 --memory=$4
echo
