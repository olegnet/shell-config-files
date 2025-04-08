## These are my configuration files for various applications on my MacBook and/or on my server running Debian

#### Alacritty (macos)
  Copy [alacritty.toml](alacritty.toml) to **~/.config/alacritty**

  - for "alacritty" TERM run this once in alacritty's source code folder (or use "xterm-256color")
    
    You can also download it [directly from GitHub.](https://github.com/alacritty/alacritty/blob/master/extra/alacritty.info)
    ```bash
    tic -xe alacritty,alacritty-direct extra/alacritty.info
    ```
  - for smooth fonts on macos run once. You can also get iTerm 2, where it's already turned on by default for Retina display.
    ```bash
    defaults write org.alacritty AppleFontSmoothing -int 0
    ```
    [see also](https://github.com/alacritty/alacritty/issues/4616)

#### tmux (both macos and Linux)
  Checkout [base tmux config](https://github.com/gpakosz/.tmux.git) and put it to **~/.tmux**

  Make a symlink in home folder to **.tmux/.tmux.conf**: `ln -s .tmux/.tmux.conf`

  Copy [.tmux.conf.local](.tmux.conf.local) to **~/**

  This is an old version of https://github.com/gpakosz/.tmux/blob/master/.tmux.conf.local with minor modifications.
