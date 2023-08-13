#!/bin/bash
namespace_name=$( kubectl get namespaces --no-headers=true | fzf | cut -d" " -f1)
kubectl config set-context --current --namespace=${namespace_name}
export ENABLE_K8S_INFO=true