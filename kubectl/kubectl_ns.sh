#!/bin/sh
NS=$1
if [ ! -z "$NS" -a "$NS"!=" " ]; then
  echo SET $NS NAMESPACE AS CURRENT NAMESPACE FOR CURRENT CONTEXT:
  kubectl config set-context --current --namespace=$NS
  echo "===== GET CONTEXTS: ====="
  kubectl config get-contexts
else
echo "===== GET CONTEXTS: ====="
kubectl config get-contexts
echo "===== GET NAMESPACES: ====="
kubectl get ns
fi