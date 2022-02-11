#!/bin/bash

ENTRYPOINT=""
case $1 in
  dev) ENTRYPOINT="entrypoints/main_dev.dart";;
  qa) ENTRYPOINT="entrypoints/main_qa.dart";;
  prod) ENTRYPOINT="entrypoints/main_prod.dart";;
esac

# Uncomment if generated_main causes error on ios
#if [ $2 == ios ]
#then
#  sed -i '' "s#.*entrypoints/main.*#import 'package:flutter_template/$ENTRYPOINT' as entrypoint;#" lib/main.dart
#fi

flutter run --flavor $1 -t "lib/$ENTRYPOINT" $2 $3 $4