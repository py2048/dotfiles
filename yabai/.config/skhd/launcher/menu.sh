TITLE="CustomSelectionMenu"

# ID=$(sed -n '2p' ~/.cache/last_display)

DISPLAY='out'

if [ "$DISPLAY" = 'out' ]; then
    SCREEN_WIDTH=2560
    SCREEN_HEIGHT=1440

    LINES=7
    COLUMNS=66

    FONT_S=30
    FONT_W=17
    FONT_H=42
else
    SCREEN_WIDTH=1675
    SCREEN_HEIGHT=1550
    LINES=7
    COLUMNS=66
    # COLUMNS=70
    FONT_S=20
    FONT_W=17
    FONT_H=42
fi


TERM_WIDTH=$((COLUMNS*FONT_W + 14))
TERM_HEIGHT=$((LINES*FONT_H + 14))

X=$((SCREEN_WIDTH/2-TERM_WIDTH/2))
Y=$((SCREEN_HEIGHT/2-TERM_HEIGHT/2))

alacritty -t "${TITLE}" \
    -o window.position.x="${X}" \
    -o window.position.y="${Y}" \
    -o window.dimensions.lines=$LINES \
    -o window.dimensions.columns=$COLUMNS \
    --config-file ~/.config/skhd/launcher/alacritty.yml \
    -e zsh -c "~/.config/skhd/launcher/menu.lua $1"
    # --command ~/.config/skhd/test/menu.py
