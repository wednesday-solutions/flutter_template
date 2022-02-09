#!/bin/sh

ENTRYPOINT=""
case $2 in
  dev) ENTRYPOINT="entrypoints/main_dev.dart";;
  qa) ENTRYPOINT="entrypoints/main_qa.dart";;
  prod) ENTRYPOINT="entrypoints/main_prod.dart";;
esac

if [ $1 == ios ]
then
  sed -i '' "s#.*entrypoints/main.*#import 'package:flutter_template/$ENTRYPOINT' as entrypoint;#" lib/main.dart
fi

flutter build $1 --flavor $2 -t "lib/$ENTRYPOINT" $3 $4