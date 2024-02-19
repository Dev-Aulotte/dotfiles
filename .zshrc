# Lines configured by zsh-newuser-install
HISTFILE=~/.local/state/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/caulotte/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "${conf}"
done
unset conf

# Herd injected PHP binary.
export PATH="/Users/caulotte/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/caulotte/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/caulotte/Library/Application Support/Herd/config/php/74/"

eval "$(zoxide init zsh)"
