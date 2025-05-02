#!/bin/bash
set -e

NAMESPACE="jenkins"
ROOT_DIR=~/Documents/GDrive/SKAI/Automation/personal/helmfiles
cd "$ROOT_DIR"

echo "Creating/Updating namespace..."
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

echo "Deploying Jenkins to namespace '$NAMESPACE'..."
helm upgrade --install jenkins ./charts/jenkins \
  -f ./charts/jenkins/values.yaml \
  -f ./values/netgod-play-cluster/netgod-jenkins.yaml \
  -n $NAMESPACE

echo "Jenkins deployment initiated. Run 'kubectl get pods -n $NAMESPACE' to check status."