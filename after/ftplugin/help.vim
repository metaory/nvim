if &modifiable
    setlocal conceallevel=0
    setlocal cursorcolumn
    ownsyntax help
endif


" This is to override hover.nvim's K keymap
nnoremap <buffer> K K
