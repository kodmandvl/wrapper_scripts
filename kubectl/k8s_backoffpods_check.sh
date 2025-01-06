#!/bin/bash
# Check for BackOff Pods on K8s clusters.
# We use KUBECONFIG environment variable for connect to K8s clusters.
# 1st argument (mandatory): directory with kubeconfig files
# 2nd argument (optional): template for kubeconfig file names (for sample, "*.yaml", "*.yml", "*.cfg", "k8s*.yaml", "config*", "config*talos*", "config" or others, default: "*.yaml")
# 3rd argument (optional): restarts count threshold (default: 0)
# Examples:
# k8s_backoffpods_check.sh ~/.kube/test
# k8s_backoffpods_check.sh ~/.kube/test "*.yaml" 1000
# k8s_backoffpods_check.sh ~/.kube/test "config*talos*"
# k8s_backoffpods_check.sh ~/.kube/test config
# k8s_backoffpods_check.sh ~/.kube/test config 15
KCF_DIR=$1
P_FILENAME_TEMPLATE=$2
P_RESTARTS_THRESHOLD=$3
echo
if [ ! -z "$P_FILENAME_TEMPLATE" -a "$P_FILENAME_TEMPLATE"!=" " ]; then
  FILENAME_TEMPLATE=$P_FILENAME_TEMPLATE
else
  FILENAME_TEMPLATE="*.yaml"
fi
if [ ! -z "$P_RESTARTS_THRESHOLD" -a "$P_RESTARTS_THRESHOLD"!=" " ]; then
  RESTARTS_THRESHOLD=$P_RESTARTS_THRESHOLD
else
  RESTARTS_THRESHOLD=0
fi
if [ ! -z "$KCF_DIR" -a "$KCF_DIR"!=" " ]; then
  echo "Check K8s clusters with KUBECONFIG files from $KCF_DIR/$FILENAME_TEMPLATE"
  echo
else
  echo -e "\033[0;31mError! You should set 1st argument (directory with kubeconfig files).\033[0m"
  echo
  exit 1
fi
RET_VAL_END=0
RET_VAL=0
CLUSTERS_COUNT=`ls -1 $KCF_DIR/$FILENAME_TEMPLATE | wc -l`
ERRORS_COUNT=0
echo "KUBECONFIG files from $KCF_DIR/$FILENAME_TEMPLATE ($CLUSTERS_COUNT clusters):"
echo
echo "####################################################################################################"
ls -1 $KCF_DIR/$FILENAME_TEMPLATE
echo "####################################################################################################"
echo
# Run:
for f in $KCF_DIR/$FILENAME_TEMPLATE; do
  export KUBECONFIG=$f
  # Your command for check cluster:
  kubectl cluster-info > /dev/null
  RET_VAL=$?
  if [ $RET_VAL -ne 0 ] ; then
    RET_VAL_END=$RET_VAL
    ERRORS_COUNT=`expr $ERRORS_COUNT + 1`
    echo -e "\033[0;31m$f - FAILURE! FAILED TO CONNECT\033[0m"
    echo
  else
    # Commands for BackOff Pods check:
    BACKOFFPODS_COUNT=$(kubectl get po -A | egrep '(CrashLoopBackOff|ImagePullBackOff|Error|ErrImagePull|InvalidImageName|Init:Error|CreateContainerError|Init)' | awk -v varthreshold="$RESTARTS_THRESHOLD" '$5>=varthreshold' | wc -l)
    if [ $BACKOFFPODS_COUNT -gt 0 ] ; then
      RET_VAL_END=1
      ERRORS_COUNT=`expr $ERRORS_COUNT + 1`
      echo -e "\033[0;31m$f - FAILURE! BACKOFF PODS (WITH RESTARTS>=$RESTARTS_THRESHOLD): $BACKOFFPODS_COUNT"
      kubectl get po -A | egrep '(CrashLoopBackOff|ImagePullBackOff|Error|ErrImagePull|InvalidImageName|Init:Error|CreateContainerError|Init)' | awk -v varthreshold="$RESTARTS_THRESHOLD" '$5>=varthreshold'
      echo -e "\033[0m"
    fi
  fi
done
if [ $RET_VAL_END -ne 0 ] ; then
  echo -e "\033[0;31mIt is not alright: return code is $RET_VAL_END. FAILURE for $ERRORS_COUNT of $CLUSTERS_COUNT clusters.\033[0m"
  echo
  exit $RET_VAL_END
else
  echo -e "\033[0;32mIt is OK\033[0m"
  echo
fi
