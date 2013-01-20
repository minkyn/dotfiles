#!/bin/sh

mkdir -p ~/.vim/{autoload,bundle}
curl -o ~/.vim/vimrc https://raw.github.com/minkyn/dotvim/master/vimrc
cd ~/.vim

git init
git submodule add git://github.com/tpope/vim-pathogen.git bundle/pathogen
git submodule add -b develop git://github.com/techlivezheng/vim-plugin-minibufexpl.git bundle/minibufexpl
git submodule add git://github.com/scrooloose/nerdtree.git bundle/nerdtree
git submodule add git://github.com/majutsushi/tagbar.git bundle/tagbar
git submodule add git://github.com/kien/ctrlp.vim.git bundle/ctrlp
git submodule add git://github.com/Shougo/neocomplcache.git bundle/neocomplcache
git submodule add git://github.com/Shougo/neosnippet.git bundle/neosnippet
git submodule add git://github.com/Raimondi/delimitMate.git bundle/delimitmate
git submodule add git://github.com/docunext/closetag.vim.git bundle/closetag
git submodule add git://github.com/Valloric/MatchTagAlways.git bundle/matchtagalways
git submodule add git://github.com/tpope/vim-surround.git bundle/surround
git submodule add git://github.com/tpope/vim-repeat.git bundle/repeat
git submodule add git://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter
git submodule add git://github.com/scrooloose/syntastic.git bundle/syntastic
git submodule add git://github.com/tpope/vim-fugitive.git bundle/fugitive

ln -s "../bundle/pathogen/autoload/pathogen.vim" autoload/pathogen.vim
ln -s ~/.vim/vimrc ~/.vimrc

git add .
git commit -m "Initial commit"
