#!/bin/bash

#CURRENT_BRANCH=$(git branch --show-current)
#
#echo ""
#
#if [ "$CURRENT_BRANCH" == "main" ]; then
#    echo "FLAVOR_NAME=prod" >> "$GITHUB_ENV"
#    echo "APK_PATH=build/app/outputs/flutter-apk/app-prod-release.apk" >> "$GITHUB_ENV"
#else
#    echo "FLAVOR_NAME=qa" >> "$GITHUB_ENV"
#    echo "APK_PATH=build/app/outputs/flutter-apk/app-qa-release.apk" >> "$GITHUB_ENV"
#fi


CURRENT_BRANCH=$(git branch --show-current)

if [ "main" == "$CURRENT_BRANCH" ]; then
  echo "Current Branch is $CURRENT_BRANCH , proceeding with prod build"
  bash $GRADLE_PATH assembleProdRelease
else
  echo "Current Branch is $CURRENT_BRANCH, Proceeding with qa build"
  RELEASE_OUTPUT_FILE=app/build/outputs/apk/qa/release/
  bash $GRADLE_PATH assembleQaRelease
fi

echo "RELEASE_OUTPUT_FILE=$RELEASE_OUTPUT_FILE">>$GITHUB_ENV