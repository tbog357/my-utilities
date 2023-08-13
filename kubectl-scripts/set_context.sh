#!/bin/bash
config_name=$(ls /home/tbog/.kube | grep "config*" | fzf)
export KUBECONFIG=/home/tbog/.kube/${config_name}
export ENABLE_K8S_INFO=true