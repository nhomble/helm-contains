#!/usr/bin/env bash

CHART_NAME=$1

if ! helm status "$CHART_NAME" -n "$HELM_NAMESPACE" &> /dev/null; then
  echo "false"
else
  echo "true"
fi
