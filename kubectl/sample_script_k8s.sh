#!/bin/bash
# Sample script for run on K8s cluster.
# Your sample commands for run:
echo "export KUBECONFIG=$KUBECONFIG"
kubectl cluster-info | head -n 1
kubectl version | grep -i server.version
