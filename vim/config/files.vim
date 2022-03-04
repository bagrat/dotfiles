noremap <leader>t :NERDTreeToggle<CR>

let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

augroup nerdtreeconceal
    autocmd!
    autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
    autocmd FileType nerdtree syntax match NERDTreeExecAsterisk #*$# containedin=NERDTreeExecFile conceal contained
augroup END

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

noremap <C-p> :Files<CR>
noremap <S-Tab> :Buffers<CR>
noremap <C-f> :Rg<CR>

map <leader><Tab> :bp\|bw #<CR>
map <leader><S-Tab> :bp\|bw! #<CR>
map <C-t> :tab split<CR>

" FZF Buffer Wipe

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
