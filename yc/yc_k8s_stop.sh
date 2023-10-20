# Script for stop YC managed-kubernetes cluster
# 1st argument: cluster-name
# Example:
# ./yc_k8s_stop.sh myk8s
echo
echo "LIST CLUSTERS:"
echo
yc managed-kubernetes cluster list
echo
echo "STOP $1 CLUSTER:"
echo
yc managed-kubernetes cluster stop --async --name $1
echo
sleep 5
echo "LIST CLUSTERS:"
echo
yc managed-kubernetes cluster list
echo
echo "DONE."
echo