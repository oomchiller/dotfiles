# Dotfiles

Core stack:

- `ghostty` — outer terminal
- `tmux` — multiplexer
- `zed` — GUI editor
- `zsh` — shell
- `k9s` — interactive Kubernetes UI
- `aerospace` — tiling window manager for macOS
- `karabiner` — keyboard remapping

## Dependencies

Install the documented Homebrew dependencies with:

```sh
brew bundle --file ~/.config/dotfiles/Brewfile
```

`gnu-stow` is the deployment mechanism for this repository.

Practical runtime dependencies:

- `ruby` for Ruby LSP, linting, and formatting in Zed
- `python` for Python tooling
- `node` for YAML/JSON/Prettier and other editor tools
- `pdk` for a usable local Puppet development stack
- `fzf` for shell history search
- `shellcheck`, `shfmt`, and `yamllint` for repo-local formatting and linting

## Installation

Clone the repository into `~/.config/dotfiles`, then stow the packages you want:

```sh
mkdir -p ~/.config
cd ~/.config/dotfiles
stow -t ~ zsh tmux zed ghostty k9s aerospace karabiner
```

If you are migrating from the old manual symlink setup, remove the existing links first:

```sh
for path in ~/.zshrc ~/.tmux.conf ~/.config/zed ~/.config/ghostty ~/.config/k9s ~/.aerospace.toml ~/.config/karabiner; do
  [ -L "$path" ] && rm "$path"
done
```

Useful stow commands:

- `stow -t ~ -nv zsh` — dry-run a package
- `stow -t ~ -D zsh` — remove a package's symlinks
- `stow -t ~ -R zsh` — restow after changes

## Minimum dependencies

- `zsh >= 5.9`
- `tmux >= 3.3`
- `nano`
- `zed`
- `ghostty` — recent stable release
- `JetBrainsMono Nerd Font Mono`
- `Homebrew`
- `gnu-stow`
- `ripgrep`
- `fd`
- `tree-sitter`
- `k9s`

Component-specific extras are documented in each component README.
