if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
set -x HOMEBREW_NO_INSTALL_CLEANUP TRUE

# Base
set -x EDITOR nvim
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# PATH
set -U fish_user_paths ~/.npm-global/bin $fish_user_paths
set -U fish_user_paths ~/go/bin $fish_user_paths
set -U fish_user_paths ~/.local/bin $fish_user_paths


# Base Alias
alias ls lsd
alias la 'lsd -a'
alias tree 'lsd --tree'

alias cat bat
alias k kubectl
alias t tmux
alias v nvim


# Python
alias evenv 'source venv/bin/activate.fish'


# Tmux
alias tn 'tmux new-session -d -s'
alias tk 'tmux kill-session -t'

# git
alias lgit lazygit

# docker
alias ldocker lazydocker

# App
alias ipython 'ipython --TerminalInteractiveShell.editing_mode=vi'



# set -l foreground DCD7BA normal
# set -l selection 2D4F67 brcyan
# set -l comment 727169 brblack
# set -l red C34043 red
# set -l orange FF9E64 brred
# set -l yellow C0A36E yellow
# set -l green 76946A green
# set -l purple 957FB8 magenta
# set -l cyan 7AA89F cyan
# set -l pink D27E99 brmagenta
#
# # Syntax Highlighting Colors
# set -g fish_color_normal $foreground
# set -g fish_color_command $cyan
# set -g fish_color_keyword $pink
# set -g fish_color_quote $yellow
# set -g fish_color_redirection $foreground
# set -g fish_color_end $orange
# set -g fish_color_error $red
# set -g fish_color_param $purple
# set -g fish_color_comment $comment
# set -g fish_color_selection --background=$selection
# set -g fish_color_search_match --background=$selection
# set -g fish_color_operator $green
# set -g fish_color_escape $pink
# set -g fish_color_autosuggestion $comment
#
# # Completion Pager Colors
# set -g fish_pager_color_progress $comment
# set -g fish_pager_color_prefix $cyan
# set -g fish_pager_color_completion $foreground
# set -g fish_pager_color_description $comment




set -l foreground f2f4f8
set -l selection 2a2a2a
set -l comment 6e6f70
set -l red ee5396
set -l orange 3ddbd9
set -l yellow 08bdba
set -l green 25be6a
set -l purple be95ff
set -l cyan 33b1ff
set -l pink ff7eb6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
