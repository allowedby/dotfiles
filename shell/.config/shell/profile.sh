#!/bin/sh

export BROWSER="firefox"
export TERMINAL="st"
export EDITOR="nvim"

export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export ELECTRUMDIR="$XDG_DATA_HOME/electrum"

export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PASSWORD_STORE_GENERATED_LENGTH=24
export PASSWORD_STORE_CLIP_TIME=15

export SQLITE_HISTORY=-
export PSQL_HISTORY=-
export LESSHISTFILE=-

export PATH="$HOME/.local/bin:$PATH"

[ "$(tty)" = "/dev/tty1" ] && exec startx
