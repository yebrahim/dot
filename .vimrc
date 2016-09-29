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
set tabstop=4
inoremap <nul> <c-n>
set expandtab
set shiftwidth=4
set softtabstop=4
filetype plugin on
filetype indent on

" yank to clipboard
set clipboard=unnamedplus

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
nnoremap > :vertical resize -1<cr>
nnoremap < :vertical resize +1<cr>
nnoremap - :resize -1<cr>
nnoremap + :resize +1<cr>
set splitbelow
set splitright

" list open files
nnoremap ff :ls<cr>:b<Space>

" open grep prompt
nnoremap Grep :Grep
nnoremap grep :Grep <c-r>=expand("<cword>")<cr><CR>

set nocompatible               " be iMproved
" filetype off                   " required!

filetype plugin indent on     " required!
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

execute pathogen#infect()
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map tre :NERDTreeToggle<CR>
" turn off smart indentation for pasting
map! jj <ESC>
" save shortcut
nnoremap ss :w<CR>
"nerdcommenter
nmap cc <leader>c<Space>

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
