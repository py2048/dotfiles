local util_func = {}

function util_func.has_key (tab, val)
    for index, value in ipairs(tab) do
        if value.key == val then
            return index
        end
    end
    return false
end

function util_func.readf(cmd)
    local fileHandle = io.popen(cmd)
    local output = fileHandle:read('*a')
    fileHandle:close()
    return output
end

function util_func.readkey()
    local readkey_f = os.getenv('HOME') .. '/.local/bin/readkey.sh'
    return util_func.readf(readkey_f):sub(1, 1)
end

return util_func
