
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

#export LC_ALL="en_GB.UTF-8"
export CLICOLOR=1
export HOMEBREW_NO_ANALYTICS=1
export RUST_BACKTRACE=1
export EZA_CONFIG_DIR=${HOME}/.config/eza
export GIT_EDITOR="zed --wait"

export PATH=\
${HOME}/bin:\
/opt/homebrew/bin:\
/opt/homebrew/sbin:\
/Applications/Xcode.app/Contents/Developer/usr/bin:\
${PATH}:\
/Applications/Alacritty.app/Contents/MacOS

WORDCHARS='*?_[]~=&;!#$%^(){}<>'
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

HISTFILE=~/.zsh_history      # Location of history file
HISTSIZE=10000               # Number of lines kept in memory
SAVEHIST=10000               # Number of lines saved to file

setopt hist_ignore_dups      # Don't record duplicate lines
setopt hist_reduce_blanks    # Remove unnecessary blanks
setopt inc_append_history    # Save each command as soon as it's run
setopt share_history         # Share history across all zsh sessions
setopt extended_history      # Add timestamps to history
setopt hist_find_no_dups     # Skip duplicate entries during search

autoload -U colors && colors
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' (%b%u)'
zstyle ':vcs_info:*' enable git

precmd() {
    vcs_info
}

if (( $terminfo[colors] >= 8 )); then
    if [ -n "$TMUX" ]; then
        PROMPT="%F{blue}╭─%F{green}%n%F{blue}@%m:%~%F{yellow}\${vcs_info_msg_0_}%f"$'\n'"%F{blue}╰─%f%# "
    else
        PROMPT="%F{green}%n%f@%F{blue}%m%f:%F{blue}%~%f%# "
    fi
else
    if [ -n "$TMUX" ]; then
        PROMPT="%n@%m:%~ \${vcs_info_msg_0_}"$'\n'"%# "
    else
        PROMPT="%n@%m:%~%# "
    fi
fi

alias ll='ls -la'
alias lt='ls -lat|less'
alias le='eza -lgae@ --no-quotes -s name'
alias top='top -o cpu'
alias ldd='otool -L'
alias unquarantine='xattr -dr com.apple.quarantine'

alias chrome-beta='open -a "Google Chrome Beta" --args --proxy-server=socks5://192.168.64.3:1080'
alias chrome-beta2='open -a "Google Chrome Beta" --args --proxy-server=socks5://192.168.10.14:1080 --proxy-bypass-list="127.0.0.1;192.168.0.0/16;10.0.0.0/8"'

alias dd_='sudo dd status=progress'
alias tma='tmux new-session -A'
alias fs1='ssh fs1 -t tmux new-session -A'
alias ifconfig.me='curl ifconfig.me'

alias tm_throttle_disable='sudo sysctl debug.lowpri_throttle_enabled=0'
function tm_show_log {
    log show --predicate 'subsystem == "com.apple.TimeMachine"' --info --last 24h;
}

if [[ "$__CFBundleIdentifier" == "org.alacritty" || -n "$TMUX" ]]; then
    ~/bin/firewall.sh
fi

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
