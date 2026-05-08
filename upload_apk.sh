#!/bin/bash

# Build the dev flavor APK
flutter clean
flutter build apk --release

# Path to the APK
APK_PATH="build/app/outputs/flutter-apk/app-release.apk"
APP_ID="1:844581921106:android:a51fb09eafa22c83bd1a8b"
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