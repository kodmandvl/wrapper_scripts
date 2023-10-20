# Script for start YC managed-kubernetes cluster
# 1st argument: cluster-name
# Example:
# ./yc_k8s_start.sh myk8s
echo
echo "LIST CLUSTERS:"
echo
yc managed-kubernetes cluster list
echo
echo "START $1 CLUSTER:"
echo
yc managed-kubernetes cluster start --async --name $1
echo
sleep 5
echo "LIST CLUSTERS:"
echo
yc managed-kubernetes cluster list
echo
echo "DONE."
echo