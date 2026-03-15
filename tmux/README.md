# tmux

## Installation

```sh
cd ~/.config/dotfiles
stow -t ~ tmux
```

## Basics

- prefix: `Ctrl+B`
- Ghostty's `Cmd+A` sends prefix
- mouse support is enabled
- system clipboard integration is enabled with `set-clipboard on`
- windows and panes start at `1`
- copy-mode uses `vi` keys

## Windows

- `t` — new window
- `W` — close window
- `[` — previous window
- `]` — next window
- `{` — move window left
- `}` — move window right
- `e` — open the session/window tree
- `q` — detach
- `r` — reload config

## Panes

- `d` — split left/right
- `D` — split top/bottom
- `w` — close pane
- `h j k l` — move between panes
- `H J K L` — resize panes
- `f` — zoom pane
- `,` — swap pane up
- `.` — swap pane down

## Copy-mode

Enter copy-mode:

- `v`

Inside copy-mode:

- `v` — start selection
- `y` — copy and leave copy-mode
- `r` — toggle rectangle selection
- double click — select a word and copy it
- triple click — select a line and copy it
