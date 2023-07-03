#!/usr/bin/env python3

import time
from pynput.keyboard import Key, Controller, Listener

import Xlib
import Xlib.display

disp = Xlib.display.Display()

keyboard = Controller()


def on_press(key):
    try:
        window = disp.get_input_focus().focus
        if window.get_wm_class()[1] != 'Hollow Knight':
            return
        if key.char == 'v':
            keyboard.press(Key.down)
            # time.sleep(0.05)
            # keyboard.press('g')
            # keyboard.release('g')
            keyboard.press(Key.space)
            keyboard.release(Key.space)
            time.sleep(0.02)
            keyboard.release(Key.down)
        elif key.char == 'f':
            keyboard.press(Key.up)
            # time.sleep(0.05)
            # keyboard.press('g')
            # keyboard.release('g')
            keyboard.press(Key.space)
            keyboard.release(Key.space)
            time.sleep(0.02)
            keyboard.release(Key.up)
    except Exception:
        pass


def on_release(key):
    pass


# Collect events until released
# with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
#     listener.join()

# ...or, in a non-blocking fashion:
listener = Listener(on_press=on_press, on_release=on_release)
listener.start()

listener.join()
