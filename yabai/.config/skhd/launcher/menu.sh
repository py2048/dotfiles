TITLE="CustomSelectionMenu"

ID=$(sed -n '2p' ~/.cache/last_display)

if [ "$ID" = '724045389' ]; then
    SCREEN_WIDTH=2560
    SCREEN_HEIGHT=1440

    LINES=7
    COLUMNS=66

    FONT_S=30
    FONT_W=17
    FONT_H=42
else
    SCREEN_WIDTH=1920
    SCREEN_HEIGHT=1600
    LINES=7
    COLUMNS=50
    # COLUMNS=70
    FONT_S=20
    FONT_W=17
    FONT_H=42
fi


# font_size 19
# FONT_W=11
# FONT_H=27

# font_size 30
# FONT_W=17
# FONT_H=42


TERM_WIDTH=$((COLUMNS*FONT_W + 14))
TERM_HEIGHT=$((LINES*FONT_H + 14))

X=$((SCREEN_WIDTH/2-TERM_WIDTH/2))
Y=$((SCREEN_HEIGHT/2-TERM_HEIGHT/2))

# X=0
# Y=0
# echo w = $TERM_WIDTH
# echo h = $TERM_HEIGHT

# echo x = $X
# echo y = $Y

# echo $SCREEN_WIDTH
# echo $SCREEN_HEIGHT

alacritty -t "${TITLE}" \
    -o window.position.x="${X}" \
    -o window.position.y="${Y}" \
    -o window.dimensions.lines=$LINES \
    -o window.dimensions.columns=$COLUMNS \
    --config-file ~/.config/skhd/launcher/alacritty.yml \
    -e luajit ~/.config/skhd/launcher/menu.lua $1
    # --command ~/.config/skhd/test/menu.py
