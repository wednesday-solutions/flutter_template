#!/bin/sh
set -e

# Commit and tag this version.
version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`

git commit -m "[skip ci] Bump version to $version" pubspec.yaml --no-verify

CURRENT_BRANCH=$(git branch --show-current)

git push origin $CURRENT_BRANCH