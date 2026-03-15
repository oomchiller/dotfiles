# Dotfiles

Core stack:

- `ghostty` — outer terminal
- `tmux` — multiplexer
- `nvim` — editor
- `zsh` — shell

## Installation

### zsh

```sh
ln -s ~/.config/dotfiles/zsh/zshrc ~/.zshrc
```

### tmux

```sh
ln -s ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

### Neovim

```sh
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
```

### Ghostty

```
ln -s ~/.config/dotfiles/ghostty ~/.config/ghostty
```

## Minimum dependencies

- `zsh >= 5.9`
- `tmux >= 3.3`
- `neovim >= 0.11`
- `ghostty` — recent stable release
- `JetBrainsMono Nerd Font Mono`
- `Homebrew`
- `ripgrep`
- `fd`
- `tree-sitter`

Component-specific extras are documented in each component README.
