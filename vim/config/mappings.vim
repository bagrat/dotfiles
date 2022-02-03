" Navigation
nnoremap J <C-e>
nnoremap K <C-y>
" get used to hjkl
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
" bash-like home/end
noremap <C-a> ^
imap <C-a> <Esc><C-a>i
noremap <C-e> $
imap <C-e> <Esc><C-e>a

" Window quick resize
noremap = :vertical resize +2<CR>:echo<CR>
noremap - :vertical resize -2<CR>:echo<CR>
noremap + :resize +2<CR>:echo<CR>
noremap _ :resize -2<CR>:echo<CR>

" Editing
" merge lines
nnoremap d<CR> J

" Searching
" reset search register and turn off highlight
nnoremap <Leader>l :noh<CR>:echo<CR>
" TODO: conside incsearch plugin

" Meta Settings
" don't get annoyed with Ex mode
nnoremap Q <Nop>

" Quit quickly
noremap <leader>q :q<CR>
noremap <leader>Q :qal!<CR><Esc>

" Stay selected in visual mode
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Replace selection keeping it in the clipboard
vmap <C-r> "_dP

" Remap code align due to resize mappings
noremap <leader>= =

" TODO: Add mapping for NERDTreeFind

" Easy conflict resolution
if &diff
    noremap z<up> :diffupdate<cr>
    noremap z<left> :diffget LO<cr>
    noremap z<right> :diffget RE<cr>
    noremap z<down> :diffget BA<cr>
    noremap <cr> ]c
    noremap \ [c
endif
