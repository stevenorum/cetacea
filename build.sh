#!/bin/bash

docker build -t "${GIT_USER}:${GIT_PACKAGE}" AmazonLinux && \
    docker tag "${GIT_USER}:${GIT_PACKAGE}" "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${CODEBUILD_RESOLVED_SOURCE_VERSION}" && \
    docker tag "${GIT_USER}:${GIT_PACKAGE}" "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${GIT_PACKAGE}_${GIT_BRANCH}" && \
    docker tag "${GIT_USER}:${GIT_PACKAGE}" "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_NAME}" && \
    docker push "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_NAME}" && \
    touch artifact.txt
