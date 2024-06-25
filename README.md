# Evil emacs kickstart

A simple emacs starter kit to start using emacs as a daily driver using [evil-mode](https://github.com/emacs-evil/evil), focused in programming.

> This config requires at least emacs 29

## Installation

1. Backup your current config, if any
2. Clone the repo `git clone https://github.com/erickgnavar/evil-emacs-kickstart.git ~/.emacs.d`
3. Start `emacs`
4. Enjoy 🎉

## Features

### Fuzzy search

Find inside project files by typing terms

### Grep search

Using [ripgrep](https://github.com/BurntSushi/ripgrep) search into project files content.

> [ripgrep](https://github.com/BurntSushi/ripgrep) should be installed and available in `PATH`

### Mode line

- Show active evil mode
- Show relative project filename
- Show battery status
- Show major mode
- Show git current branch

### Git changes indicators

Show, using `fringe` section(on the left), indicators of all the changes made into the current buffer

### Key bindings

All the actions are triggered by `<leader>` key which is `SPC`, space bar.

| Action                               | Key binding        | function called               |
|--------------------------------------|--------------------|-------------------------------|
| Select interactive function          | <kbd>SPC SPC</kbd> | `execute-extended-command`    |
| Grep project files content           | <kbd>SPC a</kbd>   | `consult-ripgrep`             |
| Search for file into project         | <kbd>SPC e</kbd>   | `project-find-file`           |
| Find file by path                    | <kbd>SPC f</kbd>   | `find-file`                   |
| Kill current buffer                  | <kbd>SPC k</kbd>   | `kill-buffer`                 |
| Toggle line numbers                  | <kbd>SPC l</kbd>   | `display-line-numbers-mode`   |
| Create a new buffer                  | <kbd>SPC n</kbd>   | `evil-buffer-new`             |
| Fuzzy search inside current buffer   | <kbd>SPC q</kbd>   | `consult-line`                |
| Paste from killring(emacs clipboard) | <kbd>SPC y</kbd>   | `consult-yank-from-kill-ring` |
| Comment code                         | <kbd>gc</kbd>      | `evil-commentary`             |
