#!/bin/sh
CTX=$1
if [ ! -z "$CTX" -a "$CTX"!=" " ]; then
  echo SET $CTX CONTEXT AS CURRENT:
  kubectl config use-context $CTX
else
echo "===== GET CONTEXTS: ====="
kubectl config get-contexts
fi