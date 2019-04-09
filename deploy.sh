#!/bin/bash
npm i \
    run build && \
    npm prune --production \
    cp -rvf dist/ ${DEPLOYMENT_TARGET} \
    cp -v package.json ${DEPLOYMENT_TARGET} \
    cp -rvf node_modules/ ${DEPLOYMENT_TARGET}/node_modules
