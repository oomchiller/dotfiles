# k9s

## Installation

```sh
cd ~/.config/dotfiles
stow k9s
```

The shell exports `K9S_CONFIG_DIR="$HOME/.config/k9s"` 

The bundled UI skin is `monokai-pro`, aligned to the Monokai Pro Ristretto palette used across the rest of the repo.

The default config runs in read-only mode for safer cluster browsing. Temporarily disable that inside k9s only when you need write actions.
