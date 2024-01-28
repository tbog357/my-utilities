#!/bin/bash
# Get context name
context_name=$(kubectl config get-contexts | fzf --header-lines=1 | awk '{print $2}' -)

# Copy config file
cp ${HOME}/.kube/config ${HOME}/.kube/config-${context_name}

# Export file
export KUBECONFIG=${HOME}/.kube/config-${context_name}
kubectl config use-context ${context_name}

# Export to env_vars
namespace_name=$(kubectl config view --minify -o jsonpath='{..namespace}')

# For terminal to recognize context and namespace
export K8S_CONTEXT=$context_name
export K8S_NAMESPACE=$namespace_name
