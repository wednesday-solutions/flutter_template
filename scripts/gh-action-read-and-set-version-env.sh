#!/bin/sh
set -e

version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`

# Set current version to github action env.
echo tag_name=v$version >> $GITHUB_ENV
