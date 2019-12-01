#!/bin/bash
if [ ! -z "$GITHUB_WORKSPACE" ]
then
    export TRAVIS_BUILD_DIR=$GITHUB_WORKSPACE
fi
exec "$@"