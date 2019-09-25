# vim:set foldmethod=marker:

#-------------------------------------------------------------------------------
# General settings
#-------------------------------------------------------------------------------

# Environment {{{
export EDITOR=vim
export VISUAL=vim
# }}}

# Aliases {{{
alias ff=_ff
alias gg=_gg
alias clean=_clean
# }}}

# Functions {{{
_ff() {
    pat="${1?}"
    shift
    locs=("${@:-.}")
    find "${locs[@]}" -iname "$pat"
}
_gg() {
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
HOMEBREW_PREFIX="$(brew --prefix 2>/dev/null)"
if [[ -n "$HOMEBREW_PREFIX"  ]]; then
    export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"
fi
# }}}

# Java {{{
if [[ -x '/usr/libexec/java_home' ]]; then
    export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
fi
# }}}

# Python {{{
if command -v pipenv >/dev/null 2>&1; then
    eval "$(pipenv --completion)"
fi

if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
# }}}

# Anaconda {{{
ANACONDA_ROOT='/usr/local/anaconda3'
if [[ -d "$ANACONDA_ROOT" ]]; then
    export PATH="$ANACONDA_ROOT/bin:$PATH"
fi
# }}}

# Android {{{
ANDROID_SDK_ROOT='/usr/local/share/android-sdk'
if [[ -d "$ANDROID_SDK_ROOT" ]]; then
    export ANDROID_SDK_ROOT
fi

ANDROID_NDK_HOME='/usr/local/share/android-ndk'
if [[ -d "$ANDROID_NDK_HOME" ]]; then
    export ANDROID_NDK_HOME
fi
# }}}
