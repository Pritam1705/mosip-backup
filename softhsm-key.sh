#!/bin/bash

export KUBECONFIG=<kubeconfig-file>
export NS=<softhsm-namespace>

# Pod name automatically fetch (assuming softhsm name in pod)
POD_NAME=$(kubectl --kubeconfig=$KUBECONFIG -n $NS get pods -o name | grep softhsm | head -n 1 | cut -d/ -f2)

echo "Pod Name: $POD_NAME"

# Backup command
kubectl --kubeconfig=$KUBECONFIG -n $NS cp $POD_NAME:softhsm/tokens ./softhsm-kernel/tokens



https://github.com/mosip/mosip-infra/tree/release-1.2.0.x/deployment/v3/external/hsm/softhsm#backup
