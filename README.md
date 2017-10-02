# My Dotfiles

## Dependencies & Assumptions
To fully utilise this repo, the following requirements are assumed.

Platform:
- OS X  
- Homebrew  
- Bash v4  
- iTerm 2 (xterm-256)  

Packages:
- rbenv  
- [thefuck](https://github.com/nvbn/thefuck)  
- Pygments (`pip install pygments`)  
- Node Webkit  
- npm  
- Browser Sync (`npm i -g browser-sync`)  
- Homebrew Apache + PHP7.0  
- Valgrind  
- ffmpeg  
- Keybase  

## Installation
Clone into `~/.dotfiles/`:  
```bash
cd ~ && git clone https://github.com/JonMcPartland/dotfiles.git .dotfiles
```

Create symlinks:  
```bash
ln -s ~/.dotfiles/bash-profile ~/.bash_profile
ln -s ~/.dotfiles/screenrc ~/.screenrc
```
