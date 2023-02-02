export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="arrow"

plugins=(git zsh-syntax-highlighting macos tmux z vi-mode)

source $ZSH/oh-my-zsh.sh

export PATH=~/.npm-global/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH=~/.local/bin:$PATH

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Fuck
eval $(thefuck --alias)
alias f='fuck' #   list, size, type

# Brew Configuration
export HOMEBREW_NO_INSTALL_CLEANUP=TRUE


# Lazy
alias lgit='lazygit' #   list, size, type
alias ldoc='lazydocker' #   list, size, type


# Neovide 
alias neo='neovide --noidle --multigrid --frame buttonless --geometry=100x100'

# Kitty
alias icat="kitty +kitten icat"


# exa
if ! (( $+commands[exa] )); then
  print "zsh-exa-plugin: exa not found on path. Please install exa before using this plugin." >&2
  return 1
fi

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
