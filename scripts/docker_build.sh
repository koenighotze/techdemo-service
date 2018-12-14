#!/bin/bash
VCS_URL=`git config --get remote.origin.url`
BUILD_TIMESTAMP=`date -u +'%Y-%m-%dT%H:%M:%SZ'`
VERSION=`node -p "require('./package.json').version"`
COMMIT_SHA=`git rev-parse HEAD`
DIRTY=`( [[ -z $(git status -s) ]] && echo '' ) || echo '-dirty'`

NAME=`node -p "require('./package.json').displayName || require('./package.json').name"`
DESCRIPTION=`node -p "require('./package.json').description"`

docker build \
      --build-arg NAME="$NAME" \
      --build-arg DESCRIPTION="$DESCRIPTION" \
      --build-arg VCS_URL="$VCS_URL" \
      --build-arg BUILD_TIMESTAMP="$BUILD_TIMESTAMP" \
      --build-arg VERSION="${VERSION}${DIRTY}" \
      --build-arg COMMIT_SHA="${COMMIT_SHA}${DIRTY}" \
      -t koenighotze/techdemo-service:"$VERSION${DIRTY}" .