# zsh

## Installation

```sh
cd ~/.config/dotfiles
stow -t ~ zsh
```

Install Oh My Zsh into the XDG data path used by this config:

```sh
git clone https://github.com/ohmyzsh/ohmyzsh.git "${XDG_DATA_HOME:-$HOME/.local/share}/oh-my-zsh"
```

Optional local overrides:

```sh
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
touch "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/local.zsh"
```

## Basics

- `oh-my-zsh` is loaded from `${XDG_DATA_HOME:-$HOME/.local/share}/oh-my-zsh` when present
- `af-magic` is the primary prompt theme; if `oh-my-zsh` is missing, the repo fallback theme is used instead
- `plugins=()` is intentionally empty to avoid alias churn; repo-managed aliases remain the source of truth
- machine-specific overrides are loaded from `${XDG_CONFIG_HOME:-$HOME/.config}/zsh/local.zsh` if present
- completions are cached in `~/.zsh/completions` and `${XDG_CACHE_HOME:-$HOME/.cache}/zsh`
- `k9s` is the preferred interactive Kubernetes workflow
- `o` aliases wrap OpenShift-specific `oc` commands

## Aliases

- `k` — `kubectl`
- `kg` — `kubectl get`
- `kd` — `kubectl describe`
- `ka` — `kubectl apply -f`
- `kl` — `kubectl logs`
- `kf` — `kubectl logs -f`
- `ke` — `kubectl exec -it`
- `k9` — `k9s`
- `kctx` — switch kube context
- `kns` — set current namespace
- `kgp` — get pods
- `kgd` — get deployments
- `kgs` — get services
- `kging` — get ingresses
- `o` — `oc`
- `op` — switch OpenShift project
- `ops` — list OpenShift projects
- `oroute` — get routes
- `onew` — `oc new-app`
- `ob` — `oc start-build`
- `ost` — `oc status`
- `ow` — `oc whoami`
- `orsh` — `oc rsh`
- `greset-hard` — `git reset --hard`
- `gclean-interactive` — `git clean -i`

## Maintenance

- `zcreset` — clear generated zsh completion cache and restart `zsh`

## Key bindings

- `Tab` — menu completion
- `Shift+Tab` — reverse menu completion
- `Ctrl+R` — `fzf` history search
- `Alt+R` / `Ctrl+S` — incremental history search backward / forward
- `Shift+Up` / `Shift+Down` — history search by current prefix
- `Alt+F` / `Ctrl+Right` — forward by word
- `Alt+B` / `Ctrl+Left` — backward by word
- `Ctrl+A` / `Ctrl+Left` — start of line
- `Ctrl+E` / `Ctrl+Right` — end of line
- `Ctrl+W` — delete previous word
- `Ctrl+H` — delete to line start

## Requirements

- `zsh >= 5.9`
- `brew`
- `zoxide`
- `nano`
- `tmux >= 3.3`
- `git`
- `lazygit`
- `docker` for docker completion
- `k9s` for interactive Kubernetes workflow
- `kubectl` for Kubernetes completion and aliases
- `podman` for podman completion
- `oc` for OpenShift completion and aliases
- `zsh-syntax-highlighting`
- `zsh-autosuggestions`
