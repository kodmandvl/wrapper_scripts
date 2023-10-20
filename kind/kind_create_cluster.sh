# Script for create kind cluster with kind-config.yml
echo
echo "CREATE $1 KIND CLUSTER AFTER 5 SECONDS:"
echo
echo "kind create cluster --name $1 --image kindest/node:v1.27.3 --config kind-config.yml"
echo
sleep 5
kind create cluster --name $1 --image kindest/node:v1.27.3 --config kind-config.yml
echo
