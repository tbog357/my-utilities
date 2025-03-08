#!/bin/bash
namespace_name=$(kubectl get ns | fzf --header-lines=1 | cut -d" " -f1)

if [ -z $namespace_name  ] || [ -z $K8S_CONTEXT ]; then
    echo "Please set_context first"
else
    cp $KUBECONFIG ${HOME}/.kube/config-${K8S_CONTEXT}-${namespace_name}
    export K8S_NAMESPACE=$namespace_name
    export KUBECONFIG=${HOME}/.kube/config-${K8S_CONTEXT}-${K8S_NAMESPACE}
    kubectl config use-context ${K8S_CONTEXT}
    kubectl config set-context --current --namespace=${namespace_name}
    echo "Using config file at ${KUBECONFIG}"
fi
