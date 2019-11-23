#!/usr/bin/env bash

curl -o ~/.profile https://raw.githubusercontent.com/minkyn/dotfiles/master/.profile
curl -o ~/.bash_profile https://raw.githubusercontent.com/minkyn/dotfiles/master/.bash_profile
curl -o ~/.bashrc https://raw.githubusercontent.com/minkyn/dotfiles/master/.bashrc
curl https://raw.githubusercontent.com/minkyn/dotfiles/master/.zshrc >> ~/.zshrc

curl -o ~/.vimrc https://raw.githubusercontent.com/minkyn/dotfiles/master/.vimrc
curl -o ~/.gitconfig https://raw.githubusercontent.com/minkyn/dotfiles/master/.gitconfig
curl -o ~/.tmux.conf https://raw.githubusercontent.com/minkyn/dotfiles/master/.tmux.conf

# curl -o ~/.ssh/config https://raw.githubusercontent.com/minkyn/dotfiles/master/.ssh_config
# chmod u=rw,go= ~/.ssh/{config,*_rsa}
# chmod a=r,u+w ~/.ssh/*_rsa.pub
# chmod u=rwx,go= ~/.ssh

# gpg --import *.gpg
# gpg --list-secret-keys --keyid-format long
# gpg --armor --export KEY_ID
# gpg --export[-secret-keys] --output KEY_FILE
