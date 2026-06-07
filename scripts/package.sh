#!/bin/bash

set -xe

BASE='./build'
NAME='Balatro_Expedition33'
STAGING="$BASE/$NAME"

mkdir -p "$STAGING"

cp -r './assets'        "$STAGING/"
cp -r './localization'  "$STAGING/"
cp -r './src'           "$STAGING/"
cp    './metadata.json' "$STAGING/"
cp    './LICENSE.md'    "$STAGING/"
cp    './README.md'     "$STAGING/"

7z a -mx9 -- "$BASE/Balatro_Expedition33.zip" "$STAGING"
