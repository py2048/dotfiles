#!/usr/bin/env zsh

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

COLOR=0xffcd950c

case ${BATT_PERCENT} in
    100) ICON=" " ;;
    9[0-9] | 8[0-9] | 7[5-9]) ICON=" " ;;
    7[0-4] | 6[0-9] | 5[0-9]) ICON=" " ;;
    4[0-9] | 3[0-9] | 2[5-9]) ICON=" " ;;
    2[0-4] | 1[0-9]) ICON=" " ;;
    *) ICON=" " && COLOR=0xffd75f5f ;;
esac

[ "$CHARGING" = "" ] || COLOR=0xFF5DFE67

sketchybar -m --set battery\
  icon.color=$COLOR \
  icon=$ICON \
  label=$(printf "${BATT_PERCENT}%%")
