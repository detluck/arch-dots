# ====================================================================
# FZF and Git Enhancements for Fish Shell
# ====================================================================

# Default Editor
if test -z "$EDITOR"
    set -gx EDITOR nvim
end

# FZF Configuration (using fd for fast search and .gitignore awareness)
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND 'fd --type f --hidden --exclude .git'
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --exclude .git'
set -gx FZF_DEFAULT_OPTS '--height 45% --layout=reverse --border rounded --info=inline'

# Enable FZF key bindings for interactive sessions:
# - Ctrl+T : Search files and insert path at cursor
# - Ctrl+R : Search command history
# - Alt+C  : Jump into child directory
if status is-interactive
    type -q fzf_key_bindings; and fzf_key_bindings
end

# --------------------------------------------------------------------
# Smart 'cd' with FZF
# --------------------------------------------------------------------
function cd --description "Smart cd: interactive fzf if no args, regular cd otherwise"
    if test (count $argv) -eq 0
        set -l target (fd --type d --hidden --exclude .git 2>/dev/null | fzf \
            --height 50% --reverse \
            --prompt "📁 Go to dir > " \
            --preview 'ls -la --color=always {} | head -n 30' \
            --preview-window 'right:50%:wrap')
        if test -n "$target"
            builtin cd $target
        end
    else
        builtin cd $argv
    end
end

# --------------------------------------------------------------------
# Smart 'git add' with FZF ('ga')
# --------------------------------------------------------------------
function ga --description "Smart git add: interactive fzf with live diff if no args"
    if test (count $argv) -gt 0
        command git add $argv
        return
    end

    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "Not a git repository."
        return 1
    end

    set -l changed (command git status -s)
    if test (count $changed) -eq 0
        echo "Working tree is clean."
        return 0
    end

    set -l selected (command git -c color.status=always status -s | fzf -m --ansi \
        --height 65% --reverse \
        --prompt "📦 Git Add (Tab to multi-select) > " \
        --header "TAB: toggle selection | ENTER: stage selected | ESC: abort" \
        --preview 'command git diff --color=always -- (string sub -s 4 -- (string replace -r "^.*-> " "" -- {})) 2>/dev/null; or cat (string sub -s 4 -- (string replace -r "^.*-> " "" -- {}))' \
        --preview-window 'right:60%:wrap')

    if test -n "$selected"
        set -l files
        for item in $selected
            set -l f (string sub -s 4 -- (string replace -r "^.*-> " "" -- "$item"))
            set -l f (string trim -c '"' -- "$f")
            set -a files "$f"
        end
        command git add -- $files
        echo "Staged "(count $files)" file(s):"
        command git status -s
    end
end

# --------------------------------------------------------------------
# Git Productivity Aliases
# --------------------------------------------------------------------
alias g="git"
alias gst="git status -sb"
alias gaa="git add --all"
alias gc="git commit -v"
alias gcm="git commit -m"
alias gca="git commit -a -m"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gds="git diff --staged"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gba="git branch -a"
alias gsta="git stash"
alias gstp="git stash pop"

# --------------------------------------------------------------------
# Fuzzy Git Branch Switcher ('fgb')
# --------------------------------------------------------------------
function fgb --description "Fuzzy switch git branch"
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "Not a git repository."
        return 1
    end
    set -l branch (command git branch -a --color=always | grep -v '/HEAD\s' | fzf --ansi --height 40% --reverse --prompt "🌿 Checkout branch > " | string trim | string replace -r '^\*\s*' '' | string replace -r '^remotes/[^/]+/' '')
    if test -n "$branch"
        command git checkout $branch
    end
end

# --------------------------------------------------------------------
# Fuzzy Git Commit Log Browser ('fgl')
# --------------------------------------------------------------------
function fgl --description "Fuzzy browse git commits"
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "Not a git repository."
        return 1
    end
    command git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" | fzf --ansi --reverse --tiebreak=index \
        --prompt "📜 Git Log > " \
        --preview 'command git show --color=always (string match -r "[a-f0-9]{7,}" {})' \
        --preview-window 'right:60%:wrap'
end

# --------------------------------------------------------------------
# Fuzzy File Opener ('fe')
# --------------------------------------------------------------------
function fe --description "Fuzzy find and edit file in nvim"
    set -l file (fd --type f --hidden --exclude .git 2>/dev/null | fzf --height 50% --reverse --prompt "📝 Open in nvim > " --preview 'cat {} | head -n 100' --preview-window 'right:60%:wrap')
    if test -n "$file"
        nvim "$file"
    end
end

# --------------------------------------------------------------------
# Fuzzy Content Search with Ripgrep ('fif')
# --------------------------------------------------------------------
function fif --description "Live ripgrep search in files and open at matching line"
    set -l match (rg --color=always --line-number --no-heading --smart-case "" 2>/dev/null | fzf --ansi \
        --height 60% --reverse \
        --prompt "🔍 Search text > " \
        --delimiter : \
        --preview 'cat {1} | head -n 100' \
        --preview-window 'right:60%:wrap')
    if test -n "$match"
        set -l parts (string split ":" -- $match)
        nvim "+$parts[2]" "$parts[1]"
    end
end
