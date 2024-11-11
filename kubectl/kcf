#!/bin/sh
KCF=$1
if [ ! -z "$KCF" -a "$KCF"!=" " ]; then
  echo SET KUBECONFIG FILE TO $KCF:
  ln -sfv $KCF ~/.kube/config
  echo "===== GET CONTEXTS: ====="
  kubectl config get-contexts
else
  echo CURRENT KUBECONFIG FILE:
  ls -alF ~/.kube/config
  echo "===== GET CONTEXTS: ====="
  kubectl config get-contexts
fi
# Check KUBECONFIG env variable for warning:
if [ ! -z "$KUBECONFIG" -a "$KUBECONFIG"!=" " ]; then
  echo "[WARN] Note that the KUBECONFIG env variable is also set: export KUBECONFIG=${KUBECONFIG}"
  echo "[WARN] To unset the KUBECONFIG env variable you should run: unset KUBECONFIG"
fi
