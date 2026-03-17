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

`gnu-stow` is the deployment mechanism for this repository.

## Installation

Clone the repository into `~/.config/dotfiles`, then stow the packages you want:

```sh
mkdir -p ~/.config
cd ~/.config/dotfiles
stow zsh tmux nvim ghostty k9s
```

If you are migrating from the old manual symlink setup, remove the existing links first:

```sh
for path in ~/.zshrc ~/.tmux.conf ~/.config/nvim ~/.config/ghostty ~/.config/k9s; do
  [ -L "$path" ] && rm "$path"
done
```

Useful stow commands:

- `stow -nv zsh` — dry-run a package
- `stow -D zsh` — remove a package's symlinks
- `stow -R zsh` — restow after changes

Neovim installs plugins on first start via `lazy.nvim`. Mason-managed external tools are installed explicitly with:

```sh
nvim --headless "+MasonToolsInstallAll" +qa
```

## Minimum dependencies

- `zsh >= 5.9`
- `tmux >= 3.3`
- `neovim >= 0.11`
- `ghostty` — recent stable release
- `JetBrainsMono Nerd Font Mono`
- `Homebrew`
- `gnu-stow`
- `ripgrep`
- `fd`
- `tree-sitter`
- `k9s`

Component-specific extras are documented in each component README.
