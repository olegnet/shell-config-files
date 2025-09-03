## These are my configuration files for various applications on my MacBook and/or on my server running Debian

### Alacritty (macOS)
  Copy [alacritty.toml](alacritty.toml) to **~/.config/alacritty**

  - for "alacritty" TERM run this once in alacritty's source code folder (or use "xterm-256color")
    
    You can also download it [directly from GitHub.](https://raw.githubusercontent.com/alacritty/alacritty/refs/heads/master/extra/alacritty.info)
    ```bash
    tic -xe alacritty,alacritty-direct alacritty.info
    ```
  - for smooth fonts on macOS run once. You can also get iTerm 2, where it's already turned on by default for Retina display.
    ```bash
    defaults write org.alacritty AppleFontSmoothing -int 0
    ```
    [see also](https://github.com/alacritty/alacritty/issues/4616)

### tmux (both macOS and Linux)
  Checkout [base tmux config](https://github.com/gpakosz/.tmux.git) and put it to **~/.tmux**

  Make a symlink in home folder to **.tmux/.tmux.conf**: `ln -s .tmux/.tmux.conf`

  Copy [.tmux.conf.local](.tmux.conf.local) to **~/**

  This is an old version of https://github.com/gpakosz/.tmux/blob/master/.tmux.conf.local with minor modifications.

### bash (both macOS and Linux)

Some comfort hacks for .bashrc with tmux, based on the default .bashrc from Debian. Good for macOS too.

```shell
BLUE='\[\033[01;34m\]'
GREEN='\[\033[01;32m\]'
HOST_COLOR='\[\033[01;35m\]' # MAGENTA
CYAN='\[\033[01;36m\]'
YELLOW='\[\033[01;33m\]'
RESET='\[\033[00m\]'

case "$TERM" in
    xterm-color|*-256color|alacritty) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    if [ -n "$TMUX" ]; then
        PS1="${debian_chroot:+($debian_chroot)}${BLUE}╭─${GREEN}\u${RESET}@${HOST_COLOR}\h${RESET}:${BLUE}\w${RESET}\n${BLUE}╰─${RESET}\$ "
    else
        PS1="${debian_chroot:+($debian_chroot)}${GREEN}\u${RESET}@${HOST_COLOR}\h${RESET}:${BLUE}\w${RESET}\$ "
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

alias tma='tmux attach || tmux new'

echo -n "tmux: " && tmux ls
echo ""
```
