#!/bin/bash

#CURRENT_BRANCH=$(git branch --show-current)
#
#echo ""
#
#if [ "$CURRENT_BRANCH" == "main" ]; then

#else
#    echo "FLAVOR_NAME=qa" >> "$GITHUB_ENV"
#    echo "APK_PATH=build/app/outputs/flutter-apk/app-qa-release.apk" >> "$GITHUB_ENV"
#fi


CURRENT_BRANCH=$(git branch --show-current)

if [ "release" == "$CURRENT_BRANCH" ]; then
  echo "Current Branch is $CURRENT_BRANCH , proceeding with prod build"
  echo "FLAVOR_NAME=prod" >> "$GITHUB_ENV"
  echo "APK_PATH=build/app/outputs/flutter-apk/app-prod-release.apk" >> "$GITHUB_ENV"
else
  echo "Current Branch is $CURRENT_BRANCH, Proceeding with qa build"
  echo "FLAVOR_NAME=qa" >> "$GITHUB_ENV"
  echo "APK_PATH=build/app/outputs/flutter-apk/app-qa-release.apk" >> "$GITHUB_ENV"
fi
