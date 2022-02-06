TITLE="CustomSelectionMenu"

if [ -f "$HOME/.cache/ex_display" ]; then
    SCREEN_WIDTH=2560
    SCREEN_HEIGHT=1440

    LINES=25
    COLUMNS=150

    FONT_S=25
    FONT_W=14
    FONT_H=35
else
    # SCREEN_WIDTH=1920
    # SCREEN_HEIGHT=1600
    SCREEN_WIDTH=2140
    SCREEN_HEIGHT=1500
    LINES=16
    COLUMNS=120
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
    -o font.size=${FONT_S}  \
    -o window.dimensions.lines=$LINES \
    -o window.dimensions.columns=$COLUMNS \
    --config-file ~/.config/skhd/launcher/alacritty_mpv.yml \
    -e zsh -c "~/.local/bin/mpvhist.sh"
