# k9s

## Installation

```sh
cd ~/.config/dotfiles
stow -t ~ k9s
```

The shell exports `K9S_CONFIG_DIR="$HOME/.config/k9s"`.

The bundled UI skin is `github-dark-default`, which keeps the Kubernetes UI close to the repo's blue/yellow accent palette.

The default config runs in read-only mode for safer cluster browsing. Temporarily disable that inside k9s only when you need write actions.

Cluster-specific history and view state are local data. They should stay outside Git and outside Stow deployment.
