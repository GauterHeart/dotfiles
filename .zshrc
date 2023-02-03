if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting macos tmux z vi-mode)

source $ZSH/oh-my-zsh.sh

export PATH=~/.npm-global/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH=~/.local/bin:$PATH

# Starship
# eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Brew Configuration
export HOMEBREW_NO_INSTALL_CLEANUP=TRUE


# Lazy
alias lgit='lazygit' #   list, size, type
alias ldoc='lazydocker' #   list, size, type


# Neovide 
# alias neo='neovide --noidle --multigrid --frame buttonless --geometry=100x100'
alias neo='neovide --frame buttonless --geometry=100x100'

# Kitty
alias icat="kitty +kitten icat"


# exa
if ! (( $+commands[exa] )); then
  print "zsh-exa-plugin: exa not found on path. Please install exa before using this plugin." >&2
  return 1
fi

# general use aliases 
alias ls='exa' # just replace ls by exa and allow all other exa arguments
alias l='ls -lbF' #   list, size, type
alias ll='ls -la' # long, all
alias llm='ll --sort=modified' # list, long, sort by modification date
alias la='ls -lbhHigUmuSa' # all list
alias lx='ls -lbhHigUmuSa@' # all list and extended
alias tree='exa --tree' # tree view
alias lS='exa -1' # one column by just names

# Cat
alias cat='bat'


# Python
alias migrate="migrate.sh"
alias py_run="py_run.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
