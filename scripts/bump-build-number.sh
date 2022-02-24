#!/bin/sh
set -e

# Find and increment the version number.
echo "Current Version: $(awk '/version: /{print $2}' pubspec.yaml)"
echo "Updating the versionNumber by 1"
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml
echo "New version: $(awk '/version: /{print $2}' pubspec.yaml)"
