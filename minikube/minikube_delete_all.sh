# Script for delete all minikube profiles
echo "DELETE ALL MINIKUBE CLUSTERS (PROFILES) AFTER 5 SECONDS..."
sleep 5
minikube delete --all
