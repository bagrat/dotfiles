let g:limelight_conceal_ctermfg = '8'

augroup goyoenter
    autocmd!
    autocmd User GoyoEnter set cursorline!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoEnter map j gj
    autocmd User GoyoEnter map k gk
    autocmd User GoyoEnter set spell
augroup END
autocmd! User GoyoLeave Limelight!

set tw=0
