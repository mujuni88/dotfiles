" keyboard shortcuts

let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>g :GitGutterToggle<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

inoremap jj <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Edit/Reload Vim Config File
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>

if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy search (FZF)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>/ :FZF <cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ag :Ack!<Space>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smooth Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close All Buffers But Current
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction
nmap <Leader>bd :call CloseAllBuffersButCurrent()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Refresh changed content
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup refresh
  autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
  autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Looping through buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump to end of pasted text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


" neomake
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning
