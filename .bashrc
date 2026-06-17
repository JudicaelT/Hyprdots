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
alias ld='lazydocker'
alias supdate='sudo dnf upgrade --refresh'

# Use colors to make ls a little easier to read
alias ls='ls --color=auto'

# Use ripgrep instead of grep
alias grep='rg'

# Ask before deleting/copying/moving a file
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# git aliases

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gsw='git switch'
alias gswc='git switch -c'
alias gc='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gpull='git pull origin $(current_branch)'
alias gpush='git push origin $(current_branch)'
alias gpushf='git push origin $(current_branch) --force'
