#!/bin/sh

set -e

echo "Get pod name: $HOSTNAME"

find /data/ -type f -exec sed -i "s/test-pod-name/$HOSTNAME/g" {} \;

exec "$@"
