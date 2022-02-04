#!/bin/sh

echo "Running static analysis with flutter analyze:"

flutter analyze --fatal-infos --fatal-warnings

status=$?

if [ "$status" = 0 ] ; then
  echo "Static analysis ran successfully."
  exit 0
else
  echo "Static analysis failed. Running dart fix."
  dart fix --apply
  echo "Static analysis failed. Running flutter format"
  flutter format lib
  exit 1
fi