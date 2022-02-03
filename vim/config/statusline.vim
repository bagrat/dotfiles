" Replace percent component of Lightline statusline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', ],
      \             [ 'readonly', 'filename' ] ],
      \   'right': [ ['percent']
          \ ]
      \ },
      \ 'inactive': {
      \   'left': [ [ ],
      \             [ 'readonly', 'filename' ] ],
      \   'right': [ []
          \ ]
      \ },
      \ 'component': {
      \ },
      \ 'component_function': {
      \   'percent': 'NoScrollbarForLightline'
      \ },
      \ 'subseparator': { 'left': '⎟', 'right': '⎟' }
      \ }

" Instead of % show NoScrollbar horizontal scrollbar
function! NoScrollbarForLightline()
    return '' . noscrollbar#statusline(20,'','') . ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    
    if fname =~ 'NERD_tree'
        if winwidth(0) > 17
            return 'Project'
        endif
        return ''
    endif

    let modified = ''
    if &modified
        let modified = ' '
    endif

    if fname == ''
        return '*' . modified
    endif

    let icon = ''
    if exists('*WebDevIconsGetFileTypeSymbol')
        let icon = WebDevIconsGetFileTypeSymbol(fname) . ' '
    endif

    return icon  . fname . modified
endfunction


function! LightLineReadonly()
    let fname = expand('%:t')

    if fname =~ "NERD_tree"
        return ''
    endif

    return &readonly ? '' : ''
endfunction


let g:lightline.enable = {}
let g:lightline.enable.statusline = 1 
let g:lightline.enable.tabline = 0

let g:lightline.component_function.filename = 'LightLineFilename'
let g:lightline.component_function.readonly = 'LightLineReadonly'
