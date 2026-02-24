
export EDITOR="vim"

autoload -Uz promptinit && promptinit
autoload -Uz compinit && compinit
autoload colors && colors

bindkey -e

# decent history size
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_VERIFY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

#remove beeps
setopt NO_BEEP

PROMPT="[%D{%H:%M:%S}]%(?..\n%K{red} %? %k) %F{cyan}%B%n@%m%b%f %~\$ $prompt_newline%% "

# stolen from arch wiki
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
if which tmux >/dev/null 2>&1; then
    test -z ${TMUX} && (tmux attach -t main 2>/dev/null || tmux new -s main)
fi

#export GOROOT=/usr/lib/go
#export GOPATH=$HOME/go

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

if [ "$SSH_AUTH_SOCK" = "" -a -x /usr/bin/ssh-agent ]; then
  eval `ssh-agent`
fi

# --- Zsh plugins (brew-installed) ---
if [ -d "$(brew --prefix 2>/dev/null)/share/zsh-autosuggestions" ]; then
  source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
if [ -d "$(brew --prefix 2>/dev/null)/share/zsh-syntax-highlighting" ]; then
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# --- fzf ---
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# --- zoxide (smart cd) ---
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# --- Modern CLI aliases ---
if command -v eza &>/dev/null; then
  alias ls="eza --icons --group-directories-first"
  alias ll="eza -la --icons --group-directories-first --git"
  alias lt="eza --tree --level=2 --icons"
fi
if command -v bat &>/dev/null; then
  alias cat="bat --paging=never"
fi
