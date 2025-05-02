#!/bin/bash
set -e

NAMESPACE="jenkins"
ROOT_DIR=~/Documents/GDrive/SKAI/Automation/personal/helmfiles
cd "$ROOT_DIR"

echo "Creating/Updating namespace..."
helm upgrade --install namespace ./charts/namespace \
  -f values/netgod-play-cluster/netgod-namespace.yaml

echo "Deploying Jenkins to namespace '$NAMESPACE'..."
helm upgrade --install jenkins ./charts/jenkins \
  -f ./charts/jenkins/values.yaml \
  -n $NAMESPACE

echo "Jenkins deployment initiated. Run 'kubectl get pods -n $NAMESPACE' to check status."