#!/bin/sh

ENTRYPOINT=""
PLIST_LOCATION=$RUNNER_TEMP/options.plist

FLAGS="$1 --flavor $2 $3 $4 $5"
echo "Requested Flavour: $2"
echo "Setting entrypoint: $GITHUB_WORKSPACE/lib/main.dart"
echo "Building $1 .......... "
echo ""
if [ $1 == ipa ]
then
  FLAGS="$FLAGS --export-options-plist=$PLIST_LOCATION"
fi
echo "************************************************************************************************************"
echo "Running flutter build $FLAGS"
echo "************************************************************************************************************"

flutter build $FLAGS
