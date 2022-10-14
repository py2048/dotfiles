function! PlutoMapping()
    nnoremap <buffer> <silent> <Leader>O :call pluto#insert_cell_above()<CR>
    nnoremap <buffer> <silent> <Leader>o :call pluto#insert_cell_below()<CR>

    nnoremap <buffer> <silent> <Leader>yy :call pluto#yank_cell()<CR>
    nnoremap <buffer> <silent> <Leader>dd :call pluto#delete_cell()<CR>

    nnoremap <buffer> <silent> <Leader>P :call pluto#paste_cell_above()<CR>
    nnoremap <buffer> <silent> <Leader>p :call pluto#paste_cell_below()<CR>

    nnoremap <buffer> <silent> <Leader>t :call pluto#toggle_code()<CR>

    " Next cell, previous cell
    nnoremap <buffer> <silent> J :call search('# ╔═╡')<CR>j
    nnoremap <buffer> <silent> K :call search('# ╔═╡', 'b')<CR>:call search('# ╔═╡', 'b')<CR>j

    " Shift-enter to run cell
    nnoremap <buffer> <silent> <S-CR> :w!<CR>
    inoremap <buffer> <silent> <S-CR> <ESC>:w!<CR>

    " Ctrl-enter to run cell then next cell
    nnoremap <buffer> <silent> <C-CR> :w!<CR>:call search('# ╔═╡')<CR>j
    inoremap <buffer> <silent> <C-CR> <ESC>:w!<CR>:call search('# ╔═╡')<CR>j

    " Wrap cell code in begin...end
    vnoremap <buffer> <silent> <Leader>s <Plug>(sandwich-add)ibegin<CR>end<CR>gv>

endfunction


function! PlutoInit()
    call PlutoMapping()
    execute "LspStart"
endfunction


au BufRead,BufNewFile *jl nmap <silent> <Leader>s :call PlutoInit()<CR>
