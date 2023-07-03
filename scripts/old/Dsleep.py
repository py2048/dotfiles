#!/usr/bin/env python3
'''
Turn off display while downloading
'''

import sys
import time
import subprocess

dtime = 30


def dsize():
    '''
    Get size of ~/Downloads (512 bytes)
    '''
    return int(subprocess.check_output(['du', '-s', '/Users/minhquandoan/Downloads/']).split()[0].decode('utf-8'))


try:
    # Terminate the previous ran program
    ID = subprocess.check_output(['pgrep', 'caffeinate']).split()[
        0].decode('utf-8')
    subprocess.run(['kill', ID])
    subprocess.run(['pkill', '-9', '-f', __file__])
    sys.exit(0)
except subprocess.CalledProcessError:
    # Main process
    p = subprocess.Popen(args=['caffeinate', '-i'],
                         stdout=subprocess.PIPE, shell=True)
    subprocess.run(['pmset', 'displaysleepnow'])  # Turn off display

    check1 = dsize()  # Initial size of directory
    # print("check0 =", check1)
    time.sleep(dtime)
    while (check2 := dsize()) - check1:  # Loop until no change in size of directory
        # print("check1 =", check1)
        # print("check2 =", check2)
        check1 = check2
        time.sleep(dtime)
    # print("Done")
    p.terminate()
