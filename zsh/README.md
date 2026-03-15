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
- `k` helpers wrap `kubectl`
- `k` uses `kubecolor` when available and falls back to `kubectl`
- `o` aliases wrap OpenShift-specific `oc` commands

## Aliases

- `k` — `kubectl`
- `kg` — `kubectl get`
- `kd` — `kubectl describe`
- `ka` — `kubectl apply -f`
- `kl` — `kubectl logs`
- `kf` — `kubectl logs -f`
- `ke` — `kubectl exec -it`
- `ky` — `kubectl get ... -o yaml` with `yq`/`bat` pretty view
- `kj` — `kubectl get ... -o json` with `jq`/`bat` pretty view
- `kev` — Kubernetes events sorted by latest timestamp
- `kimg` — list container images used by matching resources
- `kst` — `stern` log tailing for multi-pod workloads
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
- `oy` — `oc get ... -o yaml` with `yq`/`bat` pretty view
- `oj` — `oc get ... -o json` with `jq`/`bat` pretty view
- `oev` — OpenShift events sorted by latest timestamp
- `oimg` — list container images used by matching resources

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
- `kubecolor` for colorized `kubectl` output
- `podman` for podman completion
- `oc` for OpenShift completion and aliases
- `stern` for multi-pod log tailing
- `yq`
- `jq`
- `bat`
- `zsh-syntax-highlighting`
- `zsh-autosuggestions`
