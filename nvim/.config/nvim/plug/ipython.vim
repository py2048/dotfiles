" Use kitty terminal
let g:slime_target = "kitty"

function! IPyInit()
    " Creat mapping
    if !exists('b:ipython_keymap')
        let b:ipython_keymap = 1
        " Cell movement
        nmap <buffer> <silent> J :IPythonCellNextCell<CR>
        nmap <buffer> <silent> K :IPythonCellPrevCell<CR>

        " Creat new cell
        nmap <buffer> <silent> go :IPythonCellInsertBelow<CR>
        nmap <buffer> <silent> gO :IPythonCellInsertAbove<CR>
    end

    if g:slime_target == "kitty" 
        let b:slime_config = {}
        " Launch new kitty terminal
        let kitty_id = system('kitty @ launch --type=os-window ~/.local/bin/ipython | tr -d "\\n" ')
        let b:slime_config={'window_id': kitty_id, 'listen_on': ''}

    elseif g:slime_target == "neovim"
        let g:slime_default_config={}
        " open a new terminal in vertical split and run IPython
        vnew|call termopen('ipython --matplotlib')
        file ipython " name the new buffer
        let g:slime_default_config['jobid'] = b:terminal_job_id
        let g:slime_dont_ask_default = 1
        wincmd p " switch to the previous buffer
    end
endfunction

function! IPyRun()
    if !exists('b:slime_config') && !exists('g:slime_default_config')
        call IPyInit()
    end
    :IPythonCellExecuteCellJump
endfunction

function! IPyRunVerbose()
    if !exists('b:slime_config')
        call IPyInit()
    end
    :IPythonCellExecuteCellVerboseJump
endfunction

function! IPyRestart(slime_target_mode)
    if exists('b:slime_config')
        unlet b:slime_config 
    end
    if exists('g:slime_default_config')
        unlet g:slime_default_config
    end
    let g:slime_target = a:slime_target_mode
    call IPyInit()
endfunction

au BufRead,BufNewFile *.py,*.ipy nmap <silent> <S-CR> :call IPyRun()<CR>
au BufRead,BufNewFile *.py,*.ipy nmap <silent> <C-CR> :call IPyRunVerbose()<CR>
