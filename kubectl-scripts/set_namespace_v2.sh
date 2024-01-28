#!/bin/bash
namespace_name=$(kubectl get ns | fzf --header-lines=1 | cut -d" " -f1)

# Set namespace
kubectl config set-context --current --namespace=${namespace_name}

export KUBECONFIG=${HOME}/.kube/config-${K8S_CONTEXT}
export K8S_NAMESPACE=$namespace_name

