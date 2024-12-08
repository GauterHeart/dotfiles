if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
set -x HOMEBREW_NO_INSTALL_CLEANUP TRUE


# ITERM
# set -x ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES

mcfly init fish | source
# atuin init fish | source


# Base
set -x EDITOR nvim
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -g fish_cursor_insert line
# set -x TERM screen-256color

# PATH
set -U fish_user_paths ~/.npm-global/bin $fish_user_paths
set -U fish_user_paths ~/go/bin $fish_user_paths
set -U fish_user_paths ~/.local/bin $fish_user_paths


# Base Alias
alias ls lsd
alias lsa 'lsd -a'
alias ll 'lsd -l'
alias tree 'lsd --tree'

alias lsi 'lsd --ignore-config'
alias lsai 'lsd -a --ignore-config'
alias lli 'lsd -l --ignore-config'
alias treei 'lsd --tree --ignore-config'

# alias fzf "FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git' fzf $argv"

alias rm trash

alias cat bat
alias k kubectl
alias t tmux
alias v nvim
alias nv "NVIM_APPNAME=new_nvim nvim"
# alias nvide "NVIM_APPNAME=new_nvim neovide --frame none"
alias neo "neovide --title-hidden --fork"


# Git
# git commit --amend --no-edit


# Tmux
set PROJECT_CONFIG ".local/fish/config.fish"
alias tn 'tmux new-session -d -s'
alias tk 'tmux kill-session -t'
alias t_new 'tmux new -s shell'
alias t_a 'tmux a -t shell'

function project_config
	if test -e $PWD/$PROJECT_CONFIG
		tmux send-keys -t $argv "source $PWD/$PROJECT_CONFIG" Enter
		# tmux send-keys -t $argv "set fish_history ''" Enter
	end
	tmux send-keys -t $argv "clear" Enter
end

function tnh
    tmux new-session -d -s $argv
	project_config $argv
	cd
end

function tw
	set t_window $(tmux new-window -d -P -F)
	tmux send-keys -t $t_window "source $PWD/$PROJECT_CONFIG" Enter
	project_config $t_window
end

# git
alias lgit lazygit

# docker
alias ldocker lazydocker
alias dsp "docker system prune"

# wezterm
alias wrw 'wezterm cli rename-workspace'

# App
alias ipython 'ipython --TerminalInteractiveShell.editing_mode=vi'
alias pg_local 'pgcli --host 127.0.0.1 --port 5433 --user postgres --password'
alias mq_local 'pgcli --host 127.0.0.1 --port 5433 --user postgres --password'


alias ut "ulimit -n 10240"


# colors
set -g fish_color_normal ffffff
set -g fish_color_command 5ef1ff
set -g fish_color_param ffaecf
set -g fish_color_keyword 5eff6c
set -g fish_color_quote f1ff5e
set -g fish_color_redirection 5ea1ff
set -g fish_color_end bd5eff
set -g fish_color_comment 7b8496
set -g fish_color_error ff6e5e
set -g fish_color_gray 7b8496
set -g fish_color_selection --background=3c4048
set -g fish_color_search_match --background=3c4048
set -g fish_color_option f1ff5e
set -g fish_color_operator 5ea1ff
set -g fish_color_escape ffaecf
set -g fish_color_autosuggestion 7b8496
set -g fish_color_cancel ff6e5e
set -g fish_color_cwd ffbd5e
set -g fish_color_user 5ef5d2
set -g fish_color_host 5eff6c
set -g fish_color_host_remote f1ff5e
set -g fish_color_status ff6e5e
set -g fish_pager_color_progress 7b8496
set -g fish_pager_color_prefix 5ea1ff
set -g fish_pager_color_completion ffffff
set -g fish_pager_color_description 7b8496




# loaders
source /opt/homebrew/opt/asdf/libexec/asdf.fish
starship init fish | source
