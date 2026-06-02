#!/bin/zsh
set -euo pipefail

rm -rf ~/Library/Caches/com.apple.dt.Xcode
rm -rf ~/Library/Developer/CoreSimulator/Caches

xcodebuild -downloadPlatform iOS -verbose
