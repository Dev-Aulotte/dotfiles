fish_add_path /opt/homebrew/bin/

starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/caulotte/anaconda3/bin/conda
    eval /Users/caulotte/anaconda3/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function icd
    set user $HOME
    cd "$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs"
end

# This is what you often find online...
function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

function nvconf
    cd ~/.config/nvim && nvim
end

function projects
    cd $(find ~/projects/patissaulotte ~/projects/php ~/projects -mindepth 1 -maxdepth 1 -type d | fzf)
end

# ...however, for me it doesn't work without the following line
set -Ux NVM_DIR ~/.nvm

set -Ux GOPATH ~/go

set -Ux GOKU_EDN_CONFIG_FILE ~/.config/karabiner.edn

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

status --is-interactive; and source (pyenv virtualenv-init -|psub)

fish_add_path /Users/caulotte/.cargo/bin
fish_add_path /Users/caulotte/.config/emacs/bin
# fish_add_path /Users/caulotte/go/bin
fish_add_path -U $HOME/Library/Application\ Support/Herd/bin/

# Aliases
alias cl="clear"

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

alias vim="nvim"
