# Script for get status of YC managed-kubernetes cluster
# 1st argument: cluster-name
# Example:
# ./yc_k8s_status.sh myk8s
echo
echo "LIST CLUSTERS:"
echo
yc managed-kubernetes cluster list
echo
echo "GET NODES OF $1 CLUSTER:"
echo
kubectl --context yc-$1 get nodes -o wide
echo
echo "DONE."
echo