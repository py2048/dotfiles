#!/usr/bin/env luajit

CC = os.getenv('CC') or 'cc'
CXX = os.getenv('CXX') or 'cpp'
FFX = os.getenv('FF') or 'ifort'
FF = os.getenv('FX') or 'gfortran'
PY = os.getenv('PY') or 'python3'
SH = os.getenv('SH') or 'zsh'


compiler = {
    ['c'] = {CC, true},
    ['cpp'] = {CXX, true},
    ['c++'] = {CXX, true},
    ['f'] = {FFX, true},
    ['f90'] = {F, true},
    ['f95'] = {F, true},
    ['f03'] = {F, true},
    ['f08'] = {F, true},
    ['py'] = {PY, false},
    ['f08'] = {FX, true},
}

src = arg[1]
ext = src:match("[^.]+$")
ft = compiler[ext]

-- Makefile
if src == "Makefile" or src == "makefile" then
    os.execute(MAKE)
end

-- Shebang
local f = io.open(src)
local line1 = f:read()
if line1:sub(1, 2) == '#!' then
    os.execute(string.format("TIMEFMT='[Finished in %%*E]' zsh -c 'time %s %s'", line1:sub(3, -1), src))
    os.exit()
end
f:close()

-- Compile
if not ft then
    print('Can not execute')
    os.exit()
elseif ft[2] then
    bin = src:match("(.+)%..+")
    -- local f = io.popen("date +%s -r "..src)
    -- local src_time = f:read()
    -- f:close()
    -- local f = io.popen("date +%s -r "..bin)
    -- local bin_time = f:read()
    -- f:close()
    -- print(src_time-bin_time)
    os.execute(string.format("TIMEFMT='[Finished in %%*E]' zsh -c 'time CPL=%s SRC=%s BIN=%s make -f ~/.local/bin/BuildRunMakefile'", ft[1], src, bin))
-- Interpreter
elseif not ft[2]then
    os.execute(string.format("TIMEFMT='[Finished in %%*E]' zsh -c 'time %s %s'", ft[1], src))
end
