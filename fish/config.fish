if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

# zoxide
zoxide init fish | source

# navi
navi widget fish | source

# fzf
fzf --fish | source
alias f="fzf"
set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"

# eza
alias ls="eza"

# bat
alias cat="bat"

# aliases
alias pa="pikaur"
