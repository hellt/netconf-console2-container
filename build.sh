#!/usr/bin/env bash
set -e

# https://bitbucket.org/martin_volf/ncc/src/master/
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

docker buildx build \
    --push \
    --platform linux/arm64,linux/amd64 \
    --tag ghcr.io/hellt/netconf-console2:$1 \
    --build-arg VERSION=$1 \
    -f Dockerfile .