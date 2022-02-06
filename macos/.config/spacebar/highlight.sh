#!/usr/bin/env zsh

case "$1" in
    default) # default
        # spacebar -m config space_icon_strip             﫯      
        spacebar -m config space_icon_color            0xffffab91 & #ffab91
        spacebar -m config background_color            0xbb202020 & #202020
        spacebar -m config foreground_color            0xffa8a8a8 & #A8A8A8
        spacebar -m config center_shell off && spacebar -m config title on &
        ;;
    command) # green
        # spacebar -m config space_icon_color             0xff282a36 &
        # spacebar -m config space_icon_color_secondary   0xff282a36 &
        # spacebar -m config space_icon_color_tertiary    0xff282a36 &
        # spacebar -m config display_separator_icon_color 0xff282a36 &
        # spacebar -m config background_color 0xfff1f1f0             &
        # spacebar -m config foreground_color 0xff282a36             &
        spacebar -m config title off && spacebar -m config center_shell on &
        spacebar -m config center_shell_command         "echo COMMAND"
        # spacebar -m config space_icon_color             0xffffab91 & #A8A8A8
        spacebar -m config space_icon_color             0xff282a36 & #A8A8A8
        # spacebar -m config background_color             0xcc5af78e & #4ae75ecc
        # spacebar -m config foreground_color             0xffdddddd & #cccccc
        spacebar -m config foreground_color             0xff282a36             &
        spacebar -m config background_color             0xdd4f7942 & #4ae75ecc
        ;;
    focus) # green
        spacebar -m config space_icon_color             0xff282a36 &
        spacebar -m config space_icon_color_secondary   0xff282a36 &
        spacebar -m config space_icon_color_tertiary    0xff282a36 &
        spacebar -m config display_separator_icon_color 0xff282a36 &
        spacebar -m config background_color 0xff5af78e             &
        spacebar -m config foreground_color 0xff282a36             &
        ;;
    grid) # orange/magenta
        spacebar -m config space_icon_color             0xff282a36 &
        spacebar -m config space_icon_color_secondary   0xff282a36 &
        spacebar -m config space_icon_color_tertiary    0xff282a36 &
        spacebar -m config display_separator_icon_color 0xff282a36 &
        spacebar -m config background_color 0xffff6ac1             &
        spacebar -m config foreground_color 0xff282a36             &
        ;;
    swap) # red
        spacebar -m config title off && spacebar -m config center_shell on &
        spacebar -m config center_shell_command         "echo SWAP"
        spacebar -m config space_icon_color             0xffeff0eb &
        spacebar -m config background_color 0xbbff5c57             &
        spacebar -m config foreground_color 0xffeff0eb             &
        ;;
    move) # yellow
        spacebar -m config space_icon_color             0xff282a36 &
        spacebar -m config space_icon_color_secondary   0xff282a36 &
        spacebar -m config space_icon_color_tertiary    0xff282a36 &
        spacebar -m config display_separator_icon_color 0xff282a36 &
        spacebar -m config background_color 0xfff3f99d             &
        spacebar -m config foreground_color 0xff282a36             &
        ;;
    resize) # cyan
        spacebar -m config space_icon_color             0xff282a36 &
        spacebar -m config space_icon_color_secondary   0xff282a36 &
        spacebar -m config space_icon_color_tertiary    0xff282a36 &
        spacebar -m config display_separator_icon_color 0xff282a36 &
        spacebar -m config background_color 0xff9aedfe             &
        spacebar -m config foreground_color 0xff282a36             &
        ;;
    toggle) # purple
        spacebar -m config space_icon_color             0xff282a36 &
        spacebar -m config space_icon_color_secondary   0xff282a36 &
        spacebar -m config space_icon_color_tertiary    0xff282a36 &
        spacebar -m config display_separator_icon_color 0xff282a36 &
        spacebar -m config background_color 0xffcc66cc             &
        spacebar -m config foreground_color 0xff282a36             &
        ;;
    launch) # blue
        spacebar -m config space_icon_color             0xff282a36 &
        spacebar -m config space_icon_color_secondary   0xff282a36 &
        spacebar -m config space_icon_color_tertiary    0xff282a36 &
        spacebar -m config display_separator_icon_color 0xff282a36 &
        spacebar -m config background_color 0xff57c7ff             &
        spacebar -m config foreground_color 0xff282a36             &
        ;;
    window)
        spacebar -m config space_icon_strip WINDOW
        ;;
    space)
        spacebar -m config space_icon_strip SPACE
        ;;
    display)
        spacebar -m config space_icon_strip DISPLAY
        ;;
esac
