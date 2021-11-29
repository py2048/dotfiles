#!/usr/bin/env luajit


local pdir = arg[0]:match("(.*/)")

ut = dofile(pdir .. '/util_func.lua')

function app_menu()
    local apps = {
        { key = 'a', app = "AnyDesk", icon = "ﲾ " },
        { key = 'b', app = "Brave Browser", icon = " " },
        { key = 'c', app = "Visual Studio Code", icon = "﬏ ", cmd="code" },
        { key = 'd', app = "Discord", icon = "ﭮ " },
        { key = 'k', app = "KeePassXC", icon = " " },
        { key = 'm', app = "Messenger", icon = " " },
        { key = 'o', app = "Obsidian", icon = " " },
        { key = 's', app = "System Preferences", icon = " " },
        { key = 't', app = "Microsoft Teams", icon = " " },
        { key = 'v', app = "VMware Fusion", icon = " " }
    }

    
    print()
    local nl
    for k, v in pairs(apps) do
        nl = k % 2 == 0 and '\n' or ''
        io.write(string.format('    [%1s] %-25s%s', string.upper(v.key), v.app .. ' ' .. v.icon, nl))
    end

    local key = ut.readkey()
    local app_index = ut.has_key(apps, key)
    local cmd = apps[app_index].cmd

    if app_index then
        if cmd then
            io.popen('zsh -c "'..cmd..'"')
        else
            os.execute('open -a \"'..apps[app_index].app..'\"')
        end
    else
        os.exit()
    end
end

function action()
    local actions = {
        { key = 'y', label = "Move to Left Display" },
        { key = 'o', label = "Move to Right Display" },
        { key = 'u', label = "Move to Right Space" },
        { key = 'i', label = "Move to Left Space" },
        { key = 'h', label = "Swap with Right Window" },
        { key = 'l', label = "Swap with Left Window" },
        { key = 'j', label = "Swap with Lower Window" },
        { key = 'k', label = "Swap with Uppper Window" },
    }

    print()
    local nl
    for k, v in pairs(actions) do
        nl = k % 2 == 0 and '\n' or ''
        io.write(string.format('    [%1s] %-25s%s', string.upper(v.key), v.label, nl))
    end

    local key = ut.readkey()
    local cmd_index = ut.has_key(actions, key)
    

    if cmd_index then
        os.execute('skhd --key "hyper - '..actions[cmd_index].key..'"')
    else
        os.exit()
    end
end


if arg[1] == 'apps' then
    app_menu()
elseif arg[1] == 'actions' then
    action()
end


-- action()
-- app_menu()
