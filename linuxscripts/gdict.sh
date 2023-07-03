#!/usr/bin/env bash

launch_gdict() {
    xdg-open /var/lib/flatpak/exports/share/applications/org.goldendict.GoldenDict.desktop 
    sleep 1
}

pgrep goldendict || launch_gdict

/var/lib/flatpak/exports/bin/org.goldendict.GoldenDict "$(/usr/bin/copyq selection)"
