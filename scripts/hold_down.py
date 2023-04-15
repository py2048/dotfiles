#!/usr/bin/env python3

from pynput.keyboard import Key, Controller, Listener
import time

keyboard = Controller()

while True:
    keyboard.press(Key.down)
    time.sleep(0.1)

# def on_press(key):
#     keyboard.press(Key.down)

# def on_release(key):
#     keyboard.press(Key.down)

# Press Down
# keyboard.press(Key.down)

# Collect events until released
# with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
#     listener.join()

# ...or, in a non-blocking fashion:
# listener = Listener(on_press=on_press, on_release=on_release)
# listener.start()

# listener.join()
