" vim:set foldmethod=marker:

"-------------------------------------------------------------------------------
" General environment
"-------------------------------------------------------------------------------

" Baseline {{{
set nocompatible
set nobackup
set encoding=utf-8
set fileformats=unix,dos
set modeline
set modelines&
set wildmenu
" }}}

" Display {{{
syntax on
colorscheme elflord
set background=dark

set laststatus=2
set statusline=%<%F\ %w%h%m%r\ [%{&ff},%{&fenc}%Y]
set statusline+=%{exists('g:loaded_fugitive')?'\ '.fugitive#statusline():''}
set statusline+=\ %=\ %-14.(%l,%c%V%)\ %P
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
" }}}

" Formatting {{{
set textwidth=80
set nowrap
set list listchars=tab:\ \ ,trail:\ ,extends:»,precedes:«
highlight SpecialKey ctermbg=Red

set shiftwidth=2
set softtabstop=2
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

nnoremap <Leader><Leader> :SwitchLayout<CR>
nnoremap <C-M> :MBEbn<CR>
nnoremap <C-N> :MBEbp<CR>
nnoremap <F4> :MBEbd<CR>
imap <expr> <Tab> <SID>TabExpression()
smap <expr> <Tab> <SID>TabExpression()
cnoremap cd. cd %:p:h \| silent! NERDTreeCWD \| wincmd p
" }}}

" Commands {{{
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e

command! SwitchLayout call <SID>SwitchLayout()
" }}}

" Functions {{{
function! s:SwitchLayout()
  if exists(':SyntasticToggleMode')
    execute 'SyntasticToggleMode'
  endif
  if exists(':MBEToggle')
    execute 'MBEToggle'
  endif
  if exists(':NERDTreeToggle')
    execute 'NERDTreeToggle'
    wincmd p
  endif
  if exists(':TagbarToggle')
    execute 'TagbarToggle'
  endif
endfunction

function! s:TabExpression()
  let l:expr = "\<Tab>"
  if exists('g:loaded_neosnippet') &&
      \ (neosnippet#expandable() || neosnippet#jumpable())
    let l:expr = "\<Plug>(neosnippet_expand_or_jump)"
  elseif pumvisible()
    let l:expr = "\<C-N>"
  elseif col('.') != 1 && getline('.')[col('.') - 2] !~ '\s'
    let l:expr = exists('g:loaded_neocomplcache') ?
        \ "\<C-X>\<C-U>" : "\<C-X>\<C-O>"
  endif
  return l:expr
endfunction
" }}}

"-------------------------------------------------------------------------------
" Plugins configuration
"-------------------------------------------------------------------------------

" Pathogen {{{
silent! call pathogen#infect()
silent! call pathogen#helptags()
filetype plugin indent on
" }}}

" MiniBufExplorer {{{
let g:miniBufExplAutoStart = 0
let g:miniBufExplBuffersNeeded = 0
let g:miniBufExplBRSplit = 0

highlight MBENormal ctermfg=DarkCyan
highlight MBEChanged ctermfg=DarkCyan ctermbg=DarkRed
highlight MBEVisibleNormal ctermfg=DarkMagenta
highlight MBEVisibleChanged ctermfg=Magenta ctermbg=Red
highlight MBEVisibleActive cterm=underline ctermfg=Magenta
highlight MBEVisibleChangedActive cterm=underline ctermfg=LightMagenta ctermbg=Red
" }}}

" NerdTree {{{
let g:NERDTreeChDirMode = 2
" }}}

" TagBar {{{
let g:tagbar_sort = 0
" }}}

" CtrlP {{{
" }}}

" NeoComplCache {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_close_preview = 1
let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_temporary_dir = '~/.cache/neocon'
" }}}

" NeoSnippet {{{
" }}}

" DelimitMate {{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 0
let g:delimitMate_matchpairs = '(:),[:],{:}'
autocmd FileType html,xhtml,xml let g:delimitMate_matchpairs .= ',<:>'
" }}}

" CloseTag {{{
" }}}

" MatchIt {{{
runtime macros/matchit.vim
" }}}

" MatchTagAlways {{{
" }}}

" Surround + Repeat {{{
" }}}

" NerdCommenter {{{
let g:NERDSpaceDelims = 1
" }}}

" Syntastic {{{
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '☹'
" }}}

" Fugitive {{{
" }}}
