#!/bin/bash

ENTRYPOINT=""
case $1 in
  dev) ENTRYPOINT="entrypoints/main_dev.dart";;
  qa) ENTRYPOINT="entrypoints/main_qa.dart";;
  prod) ENTRYPOINT="entrypoints/main_prod.dart";;
esac

if [ $2 == ios ]
then
  sed -i '' "s#.*entrypoints/main.*#import 'package:flutter_template/$ENTRYPOINT' as entrypoint;#" lib/main.dart
fi

flutter run $2 --flavor $1 -t "lib/$ENTRYPOINT" $3 $4