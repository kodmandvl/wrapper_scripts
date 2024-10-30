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
