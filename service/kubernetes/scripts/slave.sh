#!/bin/sh
set -e

until $(nc -z -v ${master_ip} 6443); do
  echo "Waiting for API server to respond"
  sleep 5
done

kubeadm join --token=${token} ${master_ip}:6443 \
  --discovery-token-unsafe-skip-ca-verification \
  --ignore-preflight-errors=Swap
