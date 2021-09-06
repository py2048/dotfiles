set targetFolder to POSIX file "/Users/minhquandoan"
tell application "Finder"
    set aWin to make new Finder window --with properties {target:targetFolder}
    set aWin's target to targetFolder
end tell
