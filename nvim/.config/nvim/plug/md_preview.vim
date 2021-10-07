let g:mkdp_browser = 'brave-browser'
" let g:mkdp_markdown_css = expand('~/.local/share/github-markdown/github-markdown.css')

autocmd FileType markdown nmap <silent> <buffer> <leader>r <Plug>MarkdownPreviewToggle
