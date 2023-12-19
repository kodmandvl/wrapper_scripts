# Script for creating YC managed-kubernetes cluster for testing and education with low-cost parameters (20% core-fraction, HDD disk-type, preemptible, etc)
# 1st argument: cluster-name
# 2nd argument: cluster-ipv4-range
# 3rd argument: service-ipv4-range
# 4th argument: node-group-name
# 5th argument: count of nodes in node-group
# Example:
# ./yc_k8s_create.sh test 10.99.0.0/16 10.55.0.0/16 test-workers 3
# ATTENTION! Before run this script you should create KMS key and set correct values for other parameters in script: kms-key-name, service-account-name, node-service-account-name, your username for SSH, your public key for SSH, zone, subnet-name, version, etc.
echo
echo "CREATING $1 YC MANAGED-KUBERNETES CLUSTER AFTER 5 SECONDS..."
echo
sleep 5
yc managed-kubernetes cluster create --name $1 \
  --description My_K8S_cluster_for_education \
  --network-name default \
  --zone ru-central1-a \
  --subnet-name default-ru-central1-a \
  --public-ip \
  --release-channel stable \
  --version 1.27 \
  --cluster-ipv4-range $2 \
  --service-ipv4-range $3 \
  --kms-key-name my-key \
  --node-ipv4-mask-size 24 \
  --auto-upgrade=false \
  --service-account-name my-k8s-sa \
  --node-service-account-name my-node-sa \
  # end of creating
echo
echo "GET $1 CLUSTER:"
echo
yc managed-kubernetes cluster get $1
echo
echo "GET CREDENTIALS FOR $1 CLUSTER:"
echo
yc managed-kubernetes cluster get-credentials --force --external $1
echo
echo "LIST CLUSTERS:"
echo
yc managed-kubernetes cluster list
echo
echo "CREATING NODE GROUP FOR $1 YC MANAGED-KUBERNETES CLUSTER AFTER 5 SECONDS..."
echo
sleep 5
yc managed-kubernetes node-group create \
  --cluster-name $1 \
  --cores 4 \
  --core-fraction 20 \
  --auto-upgrade=false \
  --disk-size 64 \
  --disk-type network-hdd \
  --fixed-size $5 \
  --memory 8 \
  --name $4 \
  --container-runtime containerd \
  --preemptible \
  --network-interface subnets=default-ru-central1-a,ipv4-address=nat \
  --version 1.27 \
  --max-expansion 8 \
  --max-unavailable 8 \
  --platform standard-v3 \
  --metadata ssh-keys='your_user:ssh-rsa your_public_key comment_for_your_public_key' \
  # end of creating
echo
echo "GET $4 NODE GROUP:"
echo
yc managed-kubernetes node-group get --name $4
echo
echo "LIST NODES FROM $4 NODE GROUP:"
echo
yc managed-kubernetes node-group list-nodes $4
echo
echo "GET NODES OF $1 CLUSTER:"
echo
kubectl --context yc-$1 get nodes -o wide
echo
echo "DONE."
echo
