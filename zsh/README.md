# zsh

## Installation

```sh
ln -s ~/.config/dotfiles/zsh/zshrc ~/.zshrc
```

Optional local overrides:

```sh
mkdir -p ~/.config/zsh
touch ~/.config/zsh/local.zsh
```

## Basics

- local machine-specific config is loaded from `~/.config/zsh/local.zsh` if present
- completions are cached in `~/.zsh/completions` and `~/.cache/zsh`
- `k` aliases wrap `kubectl`
- `o` aliases wrap OpenShift-specific `oc` commands

## Aliases

- `k` — `kubectl`
- `kg` — `kubectl get`
- `kd` — `kubectl describe`
- `ka` — `kubectl apply -f`
- `kl` — `kubectl logs`
- `kf` — `kubectl logs -f`
- `ke` — `kubectl exec -it`
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

## Key bindings

- `Tab` — menu completion
- `Shift+Tab` — reverse menu completion
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
- `eza`
- `neovim >= 0.11`
- `tmux >= 3.3`
- `git`
- `lazygit`
- `docker` for docker completion
- `kubectl` for Kubernetes completion and aliases
- `podman` for podman completion
- `oc` for OpenShift completion and aliases
- `zsh-syntax-highlighting`
- `zsh-autosuggestions`
