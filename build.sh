#!/bin/bash -xe

IMAGE_NAME=${1:-pyenv-dde}
PYTHON_VERSION=${2:-3}

{ \
    time \
    { \
          docker builder prune -af && \
          docker build \
              --progress=plain \
              --build-arg PYTHON_VERSION=$PYTHON_VERSION \
              -t $IMAGE_NAME . ; \
    } \
} 2>&1 \
| tee logs/${IMAGE_NAME}-$(date +"%s").log
