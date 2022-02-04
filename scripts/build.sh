#!/bin/sh

ENTRYPOINT=""
case $2 in
  dev) ENTRYPOINT="lib/entrypoints/main_dev.dart";;
  qa) ENTRYPOINT="lib/entrypoints/main_qa.dart";;
  prod) ENTRYPOINT="lib/entrypoints/main_prod.dart";;
esac

flutter build $1 --flavor $2 -t "$ENTRYPOINT" $3