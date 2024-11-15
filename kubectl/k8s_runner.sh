#!/bin/bash
# We use KUBECONFIG environment variable for connect to K8s clusters.
# 1st argument (mandatory): directory with kubeconfig files
# 2nd argumet (mandatory): script for run on K8s clusters
# 3rd argument (optional): template for kubeconfig file names (for sample, "*.yaml", "*.yml", "*.cfg", "k8s*.yaml", "config*", "config*talos*", "config" or others, default: "*.yaml")
# Examples:
# k8s_runner.sh ~/.kube/test sample_script_k8s.sh
# k8s_runner.sh ~/.kube/test sample_script_k8s.sh "*.yaml"
# k8s_runner.sh ~/.kube/test sample_script_k8s.sh "config*talos*"
# k8s_runner.sh ~/.kube/test sample_script_k8s.sh config
# k8s_runner.sh ~/.kube/test sample_script_k8s.sh "*.yaml" 2>/dev/null
KCF_DIR=$1
K8S_SCRIPT=$2
P_FILENAME_TEMPLATE=$3
echo
if [ ! -z "$P_FILENAME_TEMPLATE" -a "$P_FILENAME_TEMPLATE"!=" " ]; then
  FILENAME_TEMPLATE=$P_FILENAME_TEMPLATE
else
  FILENAME_TEMPLATE="*.yaml"
fi
if [ ! -z "$KCF_DIR" -a "$KCF_DIR"!=" " -a ! -z "$K8S_SCRIPT" -a "$K8S_SCRIPT"!=" " ]; then
  echo "Run $K8S_SCRIPT script on K8s clusters with KUBECONFIG files from $KCF_DIR/$FILENAME_TEMPLATE"
else
  echo "Error! You should set 1st argument (directory with kubeconfig files) and 2nd argument (script for run on K8s clusters)"
  exit 1
fi
echo
echo "----------------------------------------------------------------------------------------------------"
echo
# Run:
for f in $KCF_DIR/$FILENAME_TEMPLATE; do
  export KUBECONFIG=$f
  $K8S_SCRIPT
  echo
  echo "----------------------------------------------------------------------------------------------------"
  echo
done
echo Done.
echo
