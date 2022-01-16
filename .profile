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

# Python {{{
# alias python=python3
# }}}

# Java {{{
if [[ -d '/usr/local/opt/java' ]]; then
    export JAVA_HOME='/usr/local/opt/java'
elif [[ -x '/usr/libexec/java_home' ]]; then
    export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
fi
# }}}

# Android {{{
ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
if [[ -d "$ANDROID_SDK_ROOT" ]]; then
    export ANDROID_SDK_ROOT
    export ANDROID_HOME="$ANDROID_SDK_ROOT"
fi

ANDROID_NDK_ROOT="$ANDROID_SDK_ROOT/ndk"
if [[ -d "$ANDROID_NDK_ROOT" ]]; then
    vers=($(ls "$ANDROID_NDK_ROOT"))
    export ANDROID_NDK_HOME="$ANDROID_NDK_ROOT/${vers[-1]}"
fi

ANDROID_PLATFORM_TOOLS="$ANDROID_SDK_ROOT/platform-tools"
if [[ -d "$ANDROID_PLATFORM_TOOLS" ]]; then
    export PATH="$ANDROID_PLATFORM_TOOLS:$PATH"
fi
# }}}
