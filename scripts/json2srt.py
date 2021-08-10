#!/usr/bin/env python

import sys
import json

def timecv(sec):
    '''
    Convert from seconds to srt time unit (hour:min:sec,mil)
    '''
    mint = int(sec) // 60
    sec -= mint * 60
    sc = f'{sec:06.3f}'.replace('.', ',') # Convert . to ,
    hour = mint // 60
    mint -= hour * 60
    return f'{hour:02d}:{mint:02d}:{sc}'

for js in sys.argv[1:]:
    with open(js, 'r') as f:
        srt = js.split('.')[0] + '.srt'   # Get name of sub file
        sub = json.loads(f.read())['body']  # Read the body of json file
        with open(srt, 'a') as s:  # write sub file
            s.truncate(0)    # clear file
            for i, dialogue in enumerate(sub):
                beg = dialogue['from']
                end = dialogue['to']
                cont = dialogue['content']
                s.write(f'{i+1}\n')
                s.write(f'{timecv(beg)} --> {timecv(end)}\n')
                s.write(f'{cont}\n\n')


