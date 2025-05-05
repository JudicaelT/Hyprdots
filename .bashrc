# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Ignore case when autocompleting
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc

# Init starship
eval "$(starship init bash)"

# Init zoxide
eval "$(zoxide init bash)"

# Aliases
alias c='clear'
alias v='nvim'
alias lg='lazygit'
alias supdate='sudo pacman -Syu'

# Use colors to make ls a little easier to read
alias ls='ls --color=auto'

# Use ripgrep instead of grep
alias grep='rg'

# Ask before deleting/copying/moving a file
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
