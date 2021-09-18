#!/usr/bin/env zsh

TITLE="CustomSelectionMenu"

SCREEN_WIDTH=2560
SCREEN_HEIGHT=1440

LINES=7
COLUMNS=65

# font_size 19
# FONT_W=11
# FONT_H=27

# font_size 30
FONT_W=17
FONT_H=42

TERM_WIDTH=$((COLUMNS*FONT_W + 14))
TERM_HEIGHT=$((LINES*FONT_H + 14))

X=$((SCREEN_WIDTH/2-TERM_WIDTH/2))
Y=$((SCREEN_HEIGHT/2-TERM_HEIGHT/2))

# echo w = $TERM_WIDTH
# echo h = $TERM_HEIGHT

# echo x = $X
# echo y = $Y


alacritty -t "${TITLE}" \
    -o window.position.x="${X}" \
    -o window.position.y="${Y}" \
    -o window.dimensions.lines=$LINES \
    -o window.dimensions.columns=$COLUMNS \
    --config-file ~/.config/skhd/launcher/alacritty.yml \
    --command ~/.config/skhd/launcher/app.sh

