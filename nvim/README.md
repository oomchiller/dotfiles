# Neovim

## Installation

```sh
cd ~/.config/dotfiles
stow nvim
```

## Clipboard

`unnamedplus` is enabled, so normal yanks go to the system clipboard.

In practice:

- `y` — copy
- `p` — paste
- `d` — delete
- `c` — change

## Main hotkeys

Leader is `Space`.

### Windows

- `<leader>sd` — vertical split
- `<leader>sD` — horizontal split
- `<leader>sh` — move left
- `<leader>sj` — move down
- `<leader>sk` — move up
- `<leader>sl` — move right
- `<leader>s0` — equalize window sizes
- `<leader>s-` — shrink width
- `<leader>s=` — grow width
- `<leader>s_` — shrink height
- `<leader>s+` — grow height
- `<leader>sw` — close window

### Files and search

- `<leader>e` — toggle the file tree
- `<leader>fc` — reveal the current file in the tree
- `<leader>fb` — list open buffers
- `<leader>ff` — live grep
- `<leader>fn` — find files
- `<leader>ft` — list Telescope builtins

### LSP

- `gd` — definition
- `gD` — declaration
- `gr` — references
- `gi` — implementation
- `<leader>ch` — hover
- `<leader>cs` — signature help
- `<leader>cd` — floating diagnostics
- `<leader>ca` — code action
- `<leader>cr` — rename
- `<leader>cf` — format

### Git

- `<leader>do` — open Diffview
- `<leader>dw` — close Diffview
- `<leader>hn` — next hunk
- `<leader>hp` — previous hunk
- `<leader>hd` — diff current file
- `<leader>hD` — diff against `~`
- `<leader>hP` — preview hunk
- `<leader>hS` — stage buffer
- `<leader>hs` — stage hunk
- `<leader>hr` — reset hunk
- `<leader>hR` — reset buffer
- `<leader>hu` — undo staged hunk

### Misc

- `<leader>=` — increment number under cursor
- `<leader>-` — decrement number under cursor
- `<leader>gn` — next quickfix item
- `<leader>gp` — previous quickfix item
- `<leader>go` — open quickfix
- `<leader>Eu` — reopen as UTF-8
- `<leader>Ew` — reopen as CP1251
- `<leader>tu` — jump to treesitter context

## Languages and tooling

- Ansible
- Terraform
- Puppet
- Python
- Ruby
- Dockerfile
- Compose
- Helm
- Kubernetes YAML

## Plugins

The main plugins in use are:

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [monokai-pro.nvim](https://github.com/loctvl842/monokai-pro.nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [schemastore.nvim](https://github.com/b0o/schemastore.nvim)
- [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [ansible-vim](https://github.com/pearofducks/ansible-vim)
- [vim-puppet](https://github.com/rodjek/vim-puppet)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [vim-helm](https://github.com/towolf/vim-helm)

## System requirements

- `neovim >= 0.11`
- [tree-sitter](https://github.com/tree-sitter/tree-sitter)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- everything else is either installed through Mason or comes from project-local toolchains
