-- Not my code: originally from https://redd.it/3t6s7k (author deleted; failed to ask for permission).
-- Only tested on Windows. Date is set to dd/mmm/yy and time to machine-wide format.
-- Save as "mpvhistory.lua" in your mpv scripts dir. Log will be saved to mpv default config directory.
-- Make sure to leave a comment if you make any improvements/changes to the script!

local HISTFILE = os.getenv('HOME')..'/.cache/mpv_history'

mp.register_event('file-loaded', function()
    local logfile
    local path = mp.get_property('path')
    if path:sub(1, 1) ~= '/' then
        path = mp.get_property('working-directory') .. '/' .. path
    end
    logfile = io.open(HISTFILE, 'a+')
    logfile:write(('[%s] %s\n'):format(os.date('%d/%b/%y %X'), path))
    logfile:close()
end)
