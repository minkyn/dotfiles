" vim:set foldmethod=marker:

"-------------------------------------------------------------------------------
" General environment
"-------------------------------------------------------------------------------

" Baseline {{{
set nocompatible
set nobackup
set encoding=utf-8
set fileformats=unix,dos
set re=0
set modeline
set modelines&
set wildmenu
" }}}

" Display {{{
syntax on
colorscheme elflord
set background=dark

set laststatus=2
set statusline=%<%F\ %w%h%m%r\ [%{&ff},%{&fenc}%Y]\ %=\ %-14.(%l,%c%V%)\ %P
highlight StatusLine ctermfg=Cyan

set showcmd
set showmode
set number
highlight LineNr ctermfg=DarkGray
" }}}

" Editing {{{
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set pastetoggle=<F2>
set matchpairs+=<:>

set hlsearch
set incsearch
set ignorecase
set infercase
set smartcase

set clipboard=unnamed
" }}}

" Formatting {{{
set textwidth=80
set nowrap
set list listchars=tab:\ \ ,trail:\ ,extends:»,precedes:«
highlight SpecialKey ctermbg=Red

set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
" }}}

"-------------------------------------------------------------------------------
" Custom settings
"-------------------------------------------------------------------------------

" Mappings {{{
nnoremap <F3> :nohlsearch<CR>
nnoremap Y y$
nnoremap Q :confirm qa<CR>
cnoremap w!! w !sudo tee % >/dev/null

nnoremap <C-]> zh
nnoremap <C-\> zl
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

imap <expr> <Tab> <SID>TabExpression()
smap <expr> <Tab> <SID>TabExpression()
" }}}

" Commands {{{
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e
" }}}

" Functions {{{
function! s:TabExpression()
  let l:expr = "\<Tab>"
  if pumvisible()
    let l:expr = "\<C-N>"
  elseif col('.') != 1 && getline('.')[col('.') - 2] !~ '\s'
    let l:expr = "\<C-X>\<C-O>"
  endif
  return l:expr
endfunction
" }}}
