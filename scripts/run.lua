#!/usr/bin/env luajit

CC = os.getenv('CC') or 'cc'
CXX = os.getenv('CXX') or 'c++'
FFX = os.getenv('FF') or 'ifort'
FF = os.getenv('FX') or 'gfortran'
PY = os.getenv('PY') or 'python3'
SH = os.getenv('SH') or 'zsh'


compiler = {
    ['c'] = {CC, true},
    ['cpp'] = {CXX, true},
    ['c++'] = {CXX, true},
    ['f'] = {FFX, true},
    ['f90'] = {FF, true},
    ['f95'] = {FF, true},
    ['f03'] = {FF, true},
    ['f08'] = {FF, true},
    ['py'] = {PY, false},
    ['f08'] = {FX, true},
}

local function f_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

src = arg[1]
ext = src:match("[^.]+$")
ft = compiler[ext]

-- Makefile
if f_exists('Makefile') or src == "Makefile" or src == "makefile" then
    os.execute('make')
    os.exit()
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
    -- os.execute(string.format("TIMEFMT='[Finished in %%*E]' zsh -c 'time CPL=%s SRC=%s BIN=%s make -f ~/.local/bin/BuildRunMakefile'", ft[1], src, bin))
    os.execute(string.format("TIMEFMT='[Finished in %%*E]' zsh -c 'time (if check_src_bin %s %s; then %s %s -o %s && ./%s; else ./%s; fi)'", src, bin, ft[1], src, bin, bin, bin)) 
-- Interpreter
elseif not ft[2]then
    os.execute(string.format("TIMEFMT='[Finished in %%*E]' zsh -c 'time %s %s'", ft[1], src))
end
