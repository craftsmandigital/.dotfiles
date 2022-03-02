# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

source ${HOME}/.zsh_plugins.sh

# Bundle zsh plugins via antibody
alias update-antibody='antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'
# Better 'ls' in MacOS
alias ls='ls -al'
# List out all globally installed npm packages
alias list-npm-globals='npm list -g --depth=0'
# Adds better handling for `rm` using trash-cli
# https://github.com/sindresorhus/trash-cli
# You can empty the trash using the empty-trash command
# https://github.com/sindresorhus/empty-trash-cli
alias rm='trash'
# use neovim instead of vim
alias vim='nvim'
# checkout branch using fzf
alias gcob='git branch | fzf | xargs git checkout'
# open vim config from anywhere
alias vimrc='vim ${HOME}/.config/nvim/init.vim'
# cat -> bat
alias cat='bat'

PATH="$PATH:$HOME/.local/bin"

# DIRCOLORS (MacOS)
export CLICOLOR=1

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"

# PATH
# export PATH=${PATH}:/usr/local/go/bin
# export PATH=${PATH}:${HOME}/go/bin

export BAT_THEME="gruvbox-dark"

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh






# https://nixos.wiki/wiki/Fzf
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# A next-generation cd command with an interactive filter
# https://github.com/b4b4r07/enhancd
ENHANCD_FILTER=fzf; export ENHANCD_FILTER

export _ZO_DATA_DIR=$HOME/.local/share
# eval "$(zoxide init zsh)"



alias vi="~/.local/bin/lvim"

# default color on ls
# https://superuser.com/questions/665274/how-to-make-ls-color-its-output-by-default-without-setting-up-an-alias
## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'


# Added tmux aliases
# https://www.barbarianmeetscoding.com/blog/jaimes-guide-to-tmux-the-most-awesome-tool-you-didnt-know-you-needed
alias t="tmux"      # 
alias ta="t a -t"   # attach to an existing session
alias tls="t ls"    # list all your sessions 
alias tn="t new -t" # create a new session

# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.histfile
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command

setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

PATH="$PATH:$HOME/.local/bin"
