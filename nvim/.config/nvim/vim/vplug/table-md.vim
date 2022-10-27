" let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

function! TexCmdInput(is_head) abort
    if a:is_head
        let l:TexCmdLast = input('Command: ', '')
        let command = printf('\%s{', l:TexCmdLast)
    else
        let command = '}'
    endif
    return command
endfunction

let g:sandwich#recipes += [
        \   {
        \       'buns'    : ['TexCmdInput(1)', 'TexCmdInput(0)'],
        \       'filetype': ['tex', 'markdown'],
        \       'kind'    : ['add', 'replace'],
        \       'action'  : ['add'],
        \       'expr'    : 1,
        \       'nesting' : 1,
        \       'input'   : ['c'],
        \       'indentkeys-' : '{,},0{,0}'
        \   },
        \ ]

let @m="c\\mathrm{\<ESC>pa}"
let @t="c\\symit{\<ESC>pa}"


autocmd FileType markdown nmap <buffer> <silent> <leader>t :TableModeToggle<CR>
