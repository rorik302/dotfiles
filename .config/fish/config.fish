if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

set -gx EDITOR nvim

starship init fish | source

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# fzf
fzf --fish | source
set -g FZF_DEFAULT_OPTS "--exact --ignore-case --style full --preview 'bat -n --color=always {}'"

# zoxide
zoxide init fish | source

# atuin
atuin init fish | source

# navi
navi widget fish | source
alias navi="navi --print | wl-copy"

# eza
alias ls="eza --long --all --header --color=always --icons --group-directories-first --git-repos --total-size"
alias tree="eza --tree -all --header --icons --color=always --group-directories-first --git-repos --total-size"
