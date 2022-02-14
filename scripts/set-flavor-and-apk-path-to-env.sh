#!/bin/sh

CURRENT_BRANCH=$(git branch --show-current)

echo ""

if [ "$CURRENT_BRANCH" == "main" ]; then
    echo "FLAVOR_NAME=prod" >> "$GITHUB_ENV"
    echo "APK_PATH=build/app/outputs/flutter-apk/app-prod-release.apk" >> "$GITHUB_ENV"
else
    echo "FLAVOR_NAME=qa" >> "$GITHUB_ENV"
    echo "APK_PATH=build/app/outputs/flutter-apk/app-qa-release.apk" >> "$GITHUB_ENV"
fi