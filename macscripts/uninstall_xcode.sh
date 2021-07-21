#!/bin/sh
xcode_location=(
    /Applications/Xcode.app
    ~/Library/MobileDevice
    ~/Library/Developer
    /System/Library/Receipts/com.apple.pkg.XcodeSystemResources.plist
    /System/Library/Receipts/com.apple.pkg.XcodeExtensionSupport.plist
    /System/Library/Receipts/com.apple.pkg.XcodeSystemResources.bom
    /System/Library/Receipts/com.apple.pkg.XcodeExtensionSupport.bom
    ~/Library/Caches/com.apple.dt.Xcode
    /Library/Preferences/com.apple.dt.Xcode.plist
    ~/Library/Preferences/com.apple.dt.Xcode.plist
)

for i in "${xcode_location[@]}"; do
    rm -rf $i
done
