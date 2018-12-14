#!/bin/bash
VERSION=`node -p "require('./package.json').version"`
COMMIT_SHA=`git rev-parse HEAD`
DIRTY=`( [[ -z $(git status -s) ]] && echo '' ) || echo '-dirty'`

docker run --entrypoint=sh --rm=true -ti --init -p 3000:3000 koenighotze/techdemo-service:$VERSION$DIRTY
