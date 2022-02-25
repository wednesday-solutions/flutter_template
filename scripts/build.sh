#!/bin/sh

ENTRYPOINT=""
PLIST_LOCATION=$RUNNER_TEMP/options.plist

case $2 in
  dev) ENTRYPOINT="entrypoints/main_dev.dart";;
  qa) ENTRYPOINT="entrypoints/main_qa.dart";;
  prod) ENTRYPOINT="entrypoints/main_prod.dart";;
esac

FLAGS="$1 --flavor $2 -t $GITHUB_WORKSPACE/lib/$ENTRYPOINT $3 $4 $5"
echo "Requested Flavour: $2"
echo "Setting entrypoint: $GITHUB_WORKSPACE/lib/$ENTRYPOINT"
echo "Building $1 .......... "
echo ""
if [ $1 == ipa ]
then
  sed -i '' "s#.*entrypoints/main.*#import 'package:flutter_template/$ENTRYPOINT' as entrypoint;#" lib/main.dart
  FLAGS="$FLAGS --export-options-plist=$PLIST_LOCATION"
elif [ $1 == ios ]
then
  sed -i '' "s#.*entrypoints/main.*#import 'package:flutter_template/$ENTRYPOINT' as entrypoint;#" lib/main.dart
fi
echo "************************************************************************************************************"
echo "Running flutter build $FLAGS"
echo "************************************************************************************************************"

flutter build $FLAGS
