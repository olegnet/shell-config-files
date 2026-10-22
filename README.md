## These are my configuration files for various applications on my MacBook and/or on my server running Debian

### Alacritty (macOS)
  Copy [alacritty.toml](alacritty.toml) to **~/.config/alacritty**

  - To enable the "alacritty" TERM entry, run this once inside the Alacritty source folder (or use "xterm-256color")
    
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
  Checkout [base tmux config](https://github.com/gpakosz/.tmux.git) and put it in **~/.tmux**

  Create a symlink in your home directory to **.tmux/.tmux.conf**: `ln -s .tmux/.tmux.conf`

  Copy [.tmux.conf.local](.tmux.conf.local) to **~/**
  Check the end of this file for useful key combinations.

  This is a modified legacy version of https://github.com/gpakosz/.tmux/blob/master/.tmux.conf.local

### zsh (both macOS and Linux)

  This is my [.zshrc](.zshrc) file. 

  Ensure the following packages are installed:
  ```bash
  brew install zsh-autosuggestions zsh-syntax-highlighting
  ```

  ```bash
  sudo apt install zsh zsh-common zsh-autosuggestions zsh-syntax-highlighting
  ```
