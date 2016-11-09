set hlsearch
set incsearch
set ignorecase
syntax on
let python_highlight_all=1
set cindent
set number                                  " line numbers
set cursorline                              " highlight cursor line
set pastetoggle=<F2>
" using alt/meta to jump words 
set linebreak
" facilitate ctag viewing
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" read tags file from upper directories
set tags=./tags;/
set tabstop=2
set softtabstop=2 expandtab
set expandtab
set shiftwidth=2
inoremap <nul> <c-n>
set autoread
filetype plugin on
filetype indent on

" yank to clipboard
if has('macunix')
    set clipboard=unnamed
elseif has('unix')
    set clipboard=unnamedplus
endif

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
    else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=1000
    echo 'Highlight current word: ON'
    return 1
    endif
    endfunction
au FileType c set makeprg=gcc\ %
au FileType cpp set makeprg=g++\ %

" requires SIMBL and MouseTerm
" enables mouse reporting in vim, so you can scroll and select using mouse
if has("mouse")
    set mouse=a
endif

" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Use system clipboard for copy/pasting
vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 

" resize buffers
nnoremap s. :vertical resize -1<cr>
nnoremap s, :vertical resize +1<cr>
nnoremap s- :resize -1<cr>
nnoremap s= :resize +1<cr>
set splitbelow
set splitright

" move between buffers
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sq :bd!<CR>

nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>

" treat wrapped lines as multi-lines
noremap k gk
noremap j gj
noremap 0 g0
noremap $ g$

" list open files
nnoremap ff :ls<cr>:b<Space>

" open grep prompt
nnoremap grep :Grep <c-r>=expand("<cword>")<cr><CR>

set nocompatible               " be iMproved
" filetype off                   " required!

filetype plugin indent on     " required!
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

execute pathogen#infect()
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map tre :NERDTreeToggle<CR>
" turn off smart indentation for pasting
map! jj <ESC>
map! kk <ESC>
" save shortcut
nnoremap ss :w<CR>
"nerdcommenter
nmap cc <leader>c<Space>
vmap cc <leader>c<Space>

" persistent undo
set undofile
set undodir=~/.backup/vim/undo,~/tmp,/tmp

set autoindent
set smartindent

" theme
color codeschool
if has('macunix')
    set guifont=Monaco:h12
endif
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

" ctrlp ignore options
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'

" fold
set foldmethod=syntax
set foldnestmax=1

" git gutter signs
let g:gitgutter_sign_added = '▓▓'
let g:gitgutter_sign_modified = '▓▓'
let g:gitgutter_sign_removed = '▓▓'

" conque term
nnoremap terminal :sp<CR>:ConqueTerm bash<CR>

" disable cursor blink
set guicursor+=n-v-c:blinkon0

" new line above
nmap <C-Enter> <ESC>ko
imap <C-Enter> <ESC>ko

" easygrep config
let g:EasyGrepRecursive=1
let g:EasyGrepCommand=1
let g:EasyGrepFilesToExclude='*.swp,*~,*.swo,.git,.git/**.**,build/'
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepJumpToMatch=0

" swap files
set noswapfile

" jedi-vim, don't show the docstring pane
autocmd FileType python setlocal completeopt-=preview
