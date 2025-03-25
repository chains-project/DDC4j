#!/bin/bash

if ! docker buildx ls --format="{{.Name}}" | grep -q 'insecure-builder'; then
    docker buildx create --driver-opt image=moby/buildkit:master \
        --use --name insecure-builder \
        --buildkitd-flags '--allow-insecure-entitlement security.insecure'
fi
docker buildx use insecure-builder
docker buildx build --allow security.insecure --progress=plain -t bootstrappable-builds_java-bootstrap .
