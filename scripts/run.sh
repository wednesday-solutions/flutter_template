#!/bin/bash

ENTRYPOINT=""
case $1 in
  dev) ENTRYPOINT="lib/entrypoints/main_dev.dart";;
  qa) ENTRYPOINT="lib/entrypoints/main_qa.dart";;
  prod) ENTRYPOINT="lib/entrypoints/main_prod.dart";;
esac

flutter run --flavor $1 -t "$ENTRYPOINT" $2