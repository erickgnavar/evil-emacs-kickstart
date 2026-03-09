# Evil Emacs Kickstart

A simple Emacs starter kit for using Emacs as a daily driver with [evil-mode](https://github.com/emacs-evil/evil),
focused on programming.

## Prerequisites

- Emacs 29 or later
- [ripgrep](https://github.com/BurntSushi/ripgrep) installed and available in `PATH` (used for project-wide grep search)

## Installation

1. Backup your current config, if any
2. Clone the repo `git clone https://github.com/erickgnavar/evil-emacs-kickstart.git ~/.emacs.d`
3. Start `emacs` (packages will be installed automatically on first launch)
4. Enjoy 🎉

## What's Included

| Package                                                          | Purpose                                            |
|------------------------------------------------------------------|----------------------------------------------------|
| [evil](https://github.com/emacs-evil/evil)                       | Vim emulation                                      |
| [evil-matchit](https://github.com/redguardtoo/evil-matchit)      | Jump between matching tags/pairs with `%`          |
| [evil-commentary](https://github.com/linktohack/evil-commentary) | Comment/uncomment with `gc`                        |
| [vertico](https://github.com/minad/vertico)                      | Vertical completion UI                             |
| [marginalia](https://github.com/minad/marginalia)                | Rich annotations in completion candidates          |
| [orderless](https://github.com/oantolin/orderless)               | Fuzzy/orderless completion style                   |
| [consult](https://github.com/minad/consult)                      | Search commands (ripgrep, buffer lines, yank ring) |
| [company](https://github.com/company-mode/company-mode)          | In-buffer completion at point                      |
| [doom-modeline](https://github.com/seagle0128/doom-modeline)     | Modeline with evil state, git branch, battery      |
| [diff-hl](https://github.com/dgutov/diff-hl)                     | Fringe markers for version control changes         |
| [which-key](https://github.com/justbur/emacs-which-key)          | Displays available keybindings after a prefix      |

## Features

### Fuzzy search

Find files inside a project by typing terms.

### Grep search

Search project file contents using [ripgrep](https://github.com/BurntSushi/ripgrep).

### Modeline

- Active evil mode (normal, insert, visual, etc.)
- Project-relative file path
- Battery status
- Major mode
- Current git branch

### Git change indicators

Fringe markers (on the left) showing all uncommitted changes in the current buffer.

## Key Bindings

All leader-key actions use `SPC` (space bar) in normal/visual mode.

| Action                         | Key binding        | Function                      |
|--------------------------------|--------------------|-------------------------------|
| Select interactive function    | <kbd>SPC SPC</kbd> | `execute-extended-command`    |
| Grep project file contents     | <kbd>SPC a</kbd>   | `consult-ripgrep`             |
| Search for file in project     | <kbd>SPC e</kbd>   | `project-find-file`           |
| Find file by path              | <kbd>SPC f</kbd>   | `find-file`                   |
| Kill current buffer            | <kbd>SPC k</kbd>   | `kill-buffer`                 |
| Toggle line numbers            | <kbd>SPC l</kbd>   | `display-line-numbers-mode`   |
| Create a new buffer            | <kbd>SPC n</kbd>   | `evil-buffer-new`             |
| Fuzzy search in current buffer | <kbd>SPC q</kbd>   | `consult-line`                |
| Paste from kill ring           | <kbd>SPC y</kbd>   | `consult-yank-from-kill-ring` |
| Comment/uncomment              | <kbd>gc</kbd>      | `evil-commentary`             |
| Previous buffer                | <kbd>M-[</kbd>     | `previous-buffer`             |
| Next buffer                    | <kbd>M-]</kbd>     | `next-buffer`                 |
