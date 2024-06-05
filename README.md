# mini-nvim
Fork of my main nvim config as an ok starting point. Description in README

Normally, I recommend Astonvim (opinionated -- this is the best preconfigured one out of 
Lunar, Nvchad etc. -- good balance between features and abstractions).

<img width="49%" alt="main" src="https://github.com/agronskiy/mini-nvim/assets/9802715/c7526d73-c363-4cc2-bd5c-2acd1995a429">
<img width="49%" alt="tele" src="https://github.com/agronskiy/mini-nvim/assets/9802715/032e983e-6562-468d-b237-e7981f2170f6">

## Install

To try-out, clone this under `~/.config`, and use 
```
❱ alias mvim='NVIM_APPNAME="mini-nvim" nvim'
```
to use as `mvim`. Or, if you want to permanently use it, rename `~/.config/mini-nvim/` into `~/.config/nvim`. 

## Features

- leader is `<space>`
- `;` is mapped to `:` (easier to enter command mode)
- fuzzy finding (telescope)
    - `<leader>ff` to fuzzy-find files
    - `<leader>fo` to find last used files
    - `<leader>fs` to find in current buffer (with preview)
    - `<leader>fw` grep in the whole directory
        - in this mode, after initial search hitting `Ctrl-F` (for Find) will allow to 
            freeze set of results and fuzzy find through them

- yanking
    - yanking yanks into your local buffer even if you work over SSH/tmux, 
        see. e.g. https://gronskiy.com/posts/2023-03-26-copy-via-vim-tmux-ssh/ for the usecase

- neo-tree
    - `<leader>O` open neo-tree
    - `q` hides it; also chosing file from there hides it.
    - neo-tree follows the currently open file

- navigation
    - `<leader>vs` opens vert split
    - `Ctrl-h` to move left, `Ctrl-l` to move right
    - `Shift-h` to move left along buffers, `Shift-l` to move right
    - `f` in normal mode will open fuzzy jumper _to visible words_ (`pounce.nvim`), type any combination you see in anywhere
        and then press one of the keys (usually home row `FGHJ` and co.) to jump there
    - `<leader>F` for "Focus" keeps only leftmost split and closes other buffers. Useful if your panes/buffers became mess.

- LSP
    - I was asked to only keep python, also lua and couple others are there
    - `gf` to open definition in floating window, then `<leader>vs` to reopen it in split
    - `gp` to open definition in split
    - other standard ones such as `Shift-K`, `gd`, `gD` work too

- autocompletion
    - works, also includes currently displayed (elsewhere) words
