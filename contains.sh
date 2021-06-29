#!/usr/bin/env bash

CHART_NAME=$1
helm status $CHART_NAME -n $HELM_NAMESPACE &> /dev/null

if [[ $? -ne 0 ]]; then 
  echo "false"
else
  echo "true"
fi
