
export EDITOR="vi"

autoload -Uz promptinit && promptinit
autoload -Uz compinit && compinit
autoload colors && colors

bindkey -e

# decent history size
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_VERIFY

#remove beeps
setopt NO_BEEP

PROMPT="[%D{%H:%M:%S}]%K{red}%(?..%?)%k %K{cyan}%B%n@%m%b%k %~\$ $prompt_newline%% "

# stolen from arch wiki
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

export GOROOT=/usr/lib/go
export GOPATH=$HOME/go

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

PATH="$PATH:$GOPATH/bin"
