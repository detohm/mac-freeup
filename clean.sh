#!/bin/bash

# --- free space check ---
BEFORE=`diskutil info / | grep "Free Space"`

# --- brew ---
echo "CLEAN UP : Brew"
brew cleanup

# --- docker ---
echo "CLEAN UP : Docker"
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)

# --- ruby ---
echo "CLEAN UP : Ruby"
gem cleanup

# --- xcode ---
echo "CLEAN UP : xcode"
# delete all sim devices
xcrun simctl delete all
# clean up derived data for xcode project
rm -rfv ~/Library/Developer/Xcode/DerivedData/
# clean up connected devices info
rm -rfv ~/Library/Developer/Xcode/iOS DeviceSupport/
# clean up archives 
rm -rfv ~/Library/Developer/Xcode/Archives/

# clear cache for both carthage & cocopods
rm -rfv ~/Library/Caches/org.carthage.CarthageKit/
rm -rfv ~/Library/Caches/CocoaPods/

# --- android ---
echo "CLEAN UP : android studio"
# clean up android emulator
rm -rfv ~/.android/avd/

# --- conda ---
echo "CLEAN UP : conda"
conda clean --all -y

# --- free space check after clean up ---
echo "FREE SPACE BEFORE CLEAN UP"
echo "$BEFORE"
echo "FREE SPACE AFTER CLEAN UP!"
diskutil info / | grep "Free Space"





