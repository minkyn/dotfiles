# vim:set foldmethod=marker:

#-------------------------------------------------------------------------------
# General settings
#-------------------------------------------------------------------------------

# Environment {{{
export EDITOR=vim
export VISUAL=vim
# }}}

# Aliases {{{
alias ff=_find
alias f.='_find .'
alias gg=_grep
alias g.='_grep .'
# }}}

# Functions {{{
_find() {
    local loc="${1?}"
    shift
    : ${@:?}
    find "$loc" -iname "$@"
}
_grep() {
    local loc="${1?}"
    shift
    : ${@:?}
    grep -Eir "$@" "$loc"
}
clean() {
    local locs=("${@:-.}")
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

# Android {{{
ANDROID_SDK=~/Library/Android/sdk
if [[ -d "$ANDROID_SDK" ]]; then
    export ANDROID_SDK
    export PATH="$ANDROID_SDK/platform-tools:$(ls -d $ANDROID_SDK/build-tools/* | tail -n 1):$PATH"

    sign() {
        local ks="${1:?'Provide key pair or keystore name as the first argument'}"
        local apk="${2:?'Provide apk to sign as the second argument'}"

        local aligned_apk="${apk}_aligned"
        zipalign -p 4 "$apk" "$aligned_apk"

        local ks_dir=~/.android
        if [[ -f "${ks_dir}/${ks}.pk8" && -f "${ks_dir}/${ks}.x509.pem" ]]; then
            apksigner sign --key "${ks_dir}/${ks}.pk8" --cert "${ks_dir}/${ks}.x509.pem" --out "$apk" "$aligned_apk"
        elif [[ -f "${ks_dir}/${ks}.jks" ]]; then
            apksigner sign --ks "${ks_dir}/${ks}.jks" --out "$apk" "$aligned_apk"
        else
            apksigner sign --ks "${ks_dir}/${ks}" --out "$apk" "$aligned_apk"
        fi

        rm -f "$aligned_apk"
    }
fi

ANDROID_NDK=~/Library/Android/sdk/ndk-bundle
if [[ -d "$ANDROID_NDK" ]]; then
    export ANDROID_NDK
    export PATH="$ANDROID_NDK:$PATH"
fi
# }}}
