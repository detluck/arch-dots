# Fish Shell Keybindings & Shortcuts Reference

> Configured in [`conf.d/fzf-git.fish`](file:///home/detluck/.config/fish/conf.d/fzf-git.fish) and [`config.fish`](file:///home/detluck/.config/fish/config.fish)  
> Shell: **Fish** | Fuzzy Finder: **fzf** | Search Engine: **fd** & **ripgrep**

---

## ⌨️ FZF Interactive Keybindings

These shortcuts can be triggered at any time while typing in your terminal:

| Keybinding | Action | Description |
| :--- | :--- | :--- |
| **`Ctrl + T`** | **Universal File Search** | Fuzzy search files and insert the selected path(s) right where your cursor is in the command line (works with `nvim`, `cat`, `rm`, etc.). |
| **`Alt + C`** | **Fuzzy Directory Jump** | Fuzzy find a child directory and immediately `cd` into it. |
| **`Ctrl + R`** | **Command History Search** | Fuzzy search through previously executed commands to rerun or edit them. |

### Inside the FZF Popup
| Key | Action |
| :--- | :--- |
| **`Tab`** | Toggle select / multi-select file (used in `ga` / `Ctrl+T`) |
| **`Shift + Tab`** | Toggle select moving upward |
| **`Enter`** | Confirm selection |
| **`Esc`** / **`Ctrl + C`** | Cancel / Close search |
| **`Ctrl + J` / `Ctrl + K`** (or **`↓` / `↑`**) | Move cursor down / up |

---

## ⚡ Smart & Interactive Fuzzy Commands

| Command | Arguments | Behavior & Meaning |
| :--- | :--- | :--- |
| **`cd`** | *(none + Enter)* | Opens interactive `fzf` directory finder with a live preview. Selecting a folder takes you there. |
| **`cd`** | `<path>` | Standard `cd` behavior (e.g. `cd ..`, `cd ~/Downloads`). |
| **`ga`** | *(none + Enter)* | Opens interactive `fzf` list of modified & untracked files with a **live diff preview**. Press `Tab` to select multiple, `Enter` to stage. |
| **`ga`** | `<files...>` | Standard `git add` behavior (e.g. `ga .`, `ga main.rs`). |
| **`fgb`** | *(none)* | **Fuzzy Git Branch:** Search local and remote git branches with fzf and checkout the selected one. |
| **`fgl`** | *(none)* | **Fuzzy Git Log:** Browse commit history interactively with a full commit diff preview on the right. |
| **`fe`** | *(none)* | **Fuzzy Edit:** Search any file in the current directory tree and open it in `nvim`. |
| **`fif`** | *(none)* | **Fuzzy In File:** Live text search through all file contents using `ripgrep`. Pressing `Enter` opens Neovim directly at that matching line. |

---

## 🌿 Git Productivity Aliases

| Alias | Expanded Command | Description |
| :--- | :--- | :--- |
| **`g`** | `git` | Git CLI shorthand |
| **`gst`** | `git status -sb` | Short status with current branch info |
| **`gaa`** | `git add --all` | Stage all modified and untracked files |
| **`gc`** | `git commit -v` | Commit with verbose diff in editor |
| **`gcm "<msg>"`** | `git commit -m "<msg>"` | Quick commit with message |
| **`gca "<msg>"`** | `git commit -a -m "<msg>"` | Stage all tracked modified files and commit |
| **`gp`** | `git push` | Push committed changes to remote |
| **`gl`** | `git pull` | Pull latest updates from remote |
| **`gd`** | `git diff` | View unstaged changes |
| **`gds`** | `git diff --staged` | View staged changes ready to commit |
| **`gco <branch>`** | `git checkout <branch>` | Switch branch or restore files |
| **`gcb <branch>`** | `git checkout -b <branch>` | Create and switch to a new branch |
| **`gb`** | `git branch` | List local branches |
| **`gba`** | `git branch -a` | List local and remote branches |
| **`gsta`** | `git stash` | Stash unstaged/working changes |
| **`gstp`** | `git stash pop` | Restore the most recently stashed changes |

---

## 🐟 Useful Built-in Fish Shortcuts

| Keybinding | Action |
| :--- | :--- |
| **`Ctrl + F`** or **`→`** | Accept full autosuggestion |
| **`Alt + →`** | Accept next word of autosuggestion |
| **`Ctrl + L`** | Clear terminal screen |
| **`Alt + L`** | List directory contents (`ls` equivalent) |
| **`Alt + Backspace`** | Delete word backwards |
| **`Alt + W`** | Show short description (`whatis`) for command under cursor |
