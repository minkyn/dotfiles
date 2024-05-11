# vim:set foldmethod=marker:

#-------------------------------------------------------------------------------
# General settings
#-------------------------------------------------------------------------------

# Environment {{{
export EDITOR=vim
export VISUAL=vim
# }}}

# Aliases {{{
alias fff=_fff
alias ggg=_ggg
alias clean=_clean
# }}}

# Functions {{{
_fff() {
    pat="${1?}"
    shift
    locs=("${@:-.}")
    find "${locs[@]}" -iname "$pat"
}
_ggg() {
    pat="${1?}"
    shift
    locs=("${@:-.}")
    grep -Eir "$pat" "${locs[@]}"
}
_clean() {
    locs=("${@:-.}")
    xattr -c -r "${locs[@]}" 2>/dev/null
    find "${locs[@]}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
    find "${locs[@]}" -name '.DS_Store' -delete
}
# }}}

#-------------------------------------------------------------------------------
# Application configuration
#-------------------------------------------------------------------------------

# Homebrew {{{
_HOMEBREW_BIN="/opt/homebrew/bin/brew"
if [[ -x "$_HOMEBREW_BIN" ]]; then
    eval "$($_HOMEBREW_BIN shellenv)"
fi
unset _HOMEBREW_BIN
# }}}

# Python {{{
_CONDA_BIN="$(brew --caskroom 2>/dev/null)/miniconda/base/bin/conda"
if [[ -x "$_CONDA_BIN" ]]; then
    eval "$($_CONDA_BIN shell.$(basename $SHELL) hook)"
fi
unset _CONDA_BIN
# }}}

# Rust {{{
if [[ -r "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi
# }}}

# Node {{{
_NVM_PREFIX="$(brew --prefix nvm 2>/dev/null)"
if [[ -r "$_NVM_PREFIX/nvm.sh" ]]; then
    . "$_NVM_PREFIX/nvm.sh"
fi
unset _NVM_PREFIX
# }}}

# Go {{{
if [[ -x "$(command -v go)" ]]; then
    export GOPATH="$HOME/.go"
    export PATH="$GOPATH/bin:$PATH"
fi
# }}}

# Java {{{
if [[ -x '/usr/libexec/java_home' ]]; then
    export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
fi
# }}}

# .Net {{{
_DOTNET_PREFIX="$(brew --prefix dotnet 2>/dev/null)"
if [[ -d "$_DOTNET_PREFIX" ]]; then
    export DOTNET_ROOT="$_DOTNET_PREFIX/libexec"
fi
unset _DOTNET_PREFIX
# }}}

# Android {{{
_ANDROID_HOME="$HOME/Library/Android/sdk"
if [[ -d "$_ANDROID_HOME" ]]; then
    export ANDROID_HOME="$_ANDROID_HOME"
    export PATH="$ANDROID_HOME/platform-tools:$PATH"
fi
unset _ANDROID_HOME
# }}}

# TeXLive {{{
_TEXLIVE_ROOT="/usr/local/texlive"
if [[ -d "$_TEXLIVE_ROOT" ]]; then
    _children=($(ls "$_TEXLIVE_ROOT"))
    _TEXLIVE_BIN="$(ls -d $_TEXLIVE_ROOT/${_children[-2]}/bin/* | tail -n 1)"
    export PATH="$_TEXLIVE_BIN:$PATH"
    unset _TEXLIVE_BIN
    unset _children
fi
unset _TEXLIVE_ROOT
# }}}
