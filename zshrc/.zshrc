# Path configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/mongodb-community/bin:$PATH"

# Ruby environment
source /usr/local/share/chruby/chruby.sh
eval "$(rbenv init - zsh)"

# Node environment
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Aliases
alias be="bundle exec"

# Git aliases (replacing OMZ git plugin)
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias cr="cargo run"

# Basic zsh configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Prompt (replace OMZ theme) - install Starship for better prompts
eval "$(starship init zsh)"

# Zoxide (already present)
eval "$(zoxide init zsh)"

# yazi configs
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

#zsh autocomplete
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
