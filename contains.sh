#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: helm contains [helm flags] <release-name>" >&2
  exit 2
fi

RELEASE_NAME=$1

# Capture stderr so a missing release stays quiet, but real failures
# (helm not on PATH, unreachable cluster, bad kubeconfig) surface.
status=0
err=$(helm status "$RELEASE_NAME" -n "$HELM_NAMESPACE" 2>&1 >/dev/null) || status=$?

if [[ $status -eq 0 ]]; then
  echo "true"
elif [[ $err == *"release: not found"* ]]; then
  echo "false"
else
  echo "$err" >&2
  exit "$status"
fi
