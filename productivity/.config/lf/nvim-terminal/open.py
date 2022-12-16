import os
import sys
from pynvim import attach

nvim = attach('socket', path=os.getenv('NVIM'))
# print(os.getenv('NVIM'))
nvim.command('LfExit')
nvim.command(f'e {sys.argv[1]}')
