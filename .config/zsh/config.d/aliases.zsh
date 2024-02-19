# use colorls instead of ls
alias ls="exa --icons -F -H --group-directories-first --git"
alias ll="ls -alF"

# Brew command
alias bu="brew update"
alias buu="brew update && brew upgrade"
alias bi="brew install"
alias bic="brew install --cask"
alias bs="brew search"
alias br="brew remove"

# Update nvim configuration
alias nvconf="cd ~/.config/nvim && nvim"

alias vim="nvim"

alias cl="clear"

alias rmd="rm -rf"
alias cpr="cp -r"

projects() {
	cd $(find ~/projects -mindepth 1 -maxdepth 3 -type d | fzf)
}
configs() {
	cd $(find ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
}
dotfiles() {
	cd ~/dotfiles
}
