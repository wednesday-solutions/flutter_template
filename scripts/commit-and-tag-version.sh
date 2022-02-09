#!/bin/sh
set -e

# Commit and tag this version.
version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`

git commit -m "Bump version to $version" pubspec.yaml --no-verify

git tag $version