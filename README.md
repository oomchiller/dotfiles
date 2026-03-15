# Dotfiles

Core stack:

- `ghostty` — outer terminal
- `tmux` — multiplexer
- `nvim` — editor
- `zsh` — shell
- `k9s` — interactive Kubernetes UI

## Dependencies

Install the documented Homebrew dependencies with:

```sh
brew bundle --file ~/.config/dotfiles/Brewfile
```

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

### K9s

```sh
mkdir -p ~/.config
ln -s ~/.config/dotfiles/k9s ~/.config/k9s
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
- `k9s`

Component-specific extras are documented in each component README.
