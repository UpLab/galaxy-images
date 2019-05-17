#!/bin/bash
set -eu

# build-publish-image.sh builds docker image using Dockerfile specification
# from folders, and pushes it out to Docker Hub.

source "$(dirname "$0")/lib.sh"

function usage() {
  echo "Usage: $0 <galaxy-app|ubuntu> <remote> [build args...]"
  echo "Run \"docker build --help\" to look up build command arguments."
  exit 1
}

if [[ $# -lt 1 ]]; then
  usage
fi

repo="$1"
remote="$2"
args="${*:3}"

if [ -z "${repo}" ]; then
  usage
fi

if [ -z "${remote}" ]; then
  usage
fi

tag=$(compute_tag)
echo "repo=${repo} remote=${remote} tag=${tag}"

cd "${repo}"
set -x
docker build -t "${remote}:${tag}" ${args} .
docker push "${remote}:${tag}"
