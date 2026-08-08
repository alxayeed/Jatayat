#!/bin/bash

# Build the dev flavor APK
flutter clean
flutter build apk --release --split-per-abi --dart-define=FLAVOR=prod

# Path to the APK
APK_PATH="build/app/outputs/flutter-apk/app-arm64-v8a-release.apk"
APP_ID="1:80890607538:android:6944957d81e1f7abbfd6ab"
RELEASE_NOTES_FILE_PATH="changelog.txt"
#TESTERS_EMAILS="alxayeed@gmail.com"
TESTERS_GROUP="dev"

# Upload to Firebase App Distribution
#firebase appdistribution:distribute $APK_PATH --app $APP_ID \
#    --release-notes-file $RELEASE_NOTES_FILE_PATH \
#    --groups "$TESTERS_GROUP"

firebase appdistribution:distribute $APK_PATH \
  --app $APP_ID \
  --release-notes-file $RELEASE_NOTES_FILE_PATH \
  --groups "$TESTERS_GROUP"