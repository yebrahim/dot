set hlsearch
set incsearch
syntax on
set cindent
set number                                  " line numbers
set cursorline                              " highlight cursor line
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
set undofile
set undodir=~/.vim/undodir

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
set gfn=Monospace\ 9
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


" If vundle is not installed, do it first
if (!isdirectory(expand("$HOME/.vim/bundle/vundle")))
    call system(expand("mkdir -p $HOME/.vim/bundle"))
    call system(expand("git clone git@github.com:gmarik/vundle $HOME/.vim/bundle/vundle"))
    echoerr 'Vundle was freshly installed. You should run :BundleInstall'
endif

set nocompatible               " be iMproved
" filetype off                   " required!

set rtp+=~/.vim/bundle/vundle 
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'file:///Users/Y/.vim/downloaded_bundles/MatchTagAlways'
" ...

filetype plugin indent on     " required!
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

