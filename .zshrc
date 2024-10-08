# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/b/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gallois" 


# home manager
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    archlinux
    poetry
    npm
    stack
    dotnet
    keychain
    themes
    cabal
    zsh-navigation-tools
    zsh-autosuggestions
    zsh-syntax-highlighting)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
# 3 4 6 7

# eval "$(starship init zsh)"
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

#You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacsclient -s doom -c -nw'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

cmd() {
  echo '|>>' $1 ${@:2} 
  $1 ${@:2} 
}


#alias mx="mullvad-exclude"
mx() { cmd mullvad-exclude $@ }
# emacs aliases

# alias doom-emacs="emacs --init-directory=$HOME/.emacs.doom.d"
# alias vanilla-emacs="emacs --init-directory=$HOME/.emacs.vanilla.d"



export TESSDATA_PREFIX="/usr/share/tessdata/"
export QT_QPA_PLATFORMTHEME=qt5ct
export _JAVA_AWT_WM_NONREPARENTING=1
PERL5LIB="/home/b/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/b/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/b/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/b/perl5"; export PERL_MM_OPT;
export TERM=xterm-256color
export N_PREFIX=/home/b/.n/
export N_CACHE_PREFIX=/home/b/.ncache
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#[ -f "/home/b/.ghcup/env" ] && source "/home/b/.ghcup/env" # ghcup-env
#eval "$(rbenv init -)"
DOTNET_CLI_TELEMETRY_OPTOUT=1.
#alias mx="mullvad-exclude"
#. /opt/asdf-vm/asdf.sh



# If not running interactively, do not do anything
[[ $- != *i* ]] && return
# Otherwise start tmux
# [[ -z "$TMUX" ]] && exec tmux

#!/bin/bash

[ -f "/home/b/.ghcup/env" ] && source "/home/b/.ghcup/env" # ghcup-env
. /opt/asdf-vm/asdf.sh

. ~/.asdf/plugins/java/set-java-home.zsh

export PATH="$HOME/.config/rofi/bin:$PATH"
# export PATH="$HOME/Projects/scripts/shell:$PATH"
# export PATH="$HOME/Projects/scripts/python/:$PATH"
# export PATH="$HOME/Projects/scripts/haskell/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
PATH="/home/b/perl5/bin${PATH:+:${PATH}}"; export PATH;
export PATH="$N_PREFIX/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"
export PATH="$HOME/.dotnet:$PATH"
export PATH="/opt/lampp/bin:$PATH"
export PATH="/opt/anaconda/bin:$PATH"
export PATH="/home/b/Games/modding/infinityengine/gemrb:$PATH"
 
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# opam configuration
[[ ! -r /home/b/.opam/opam-init/init.zsh ]] || source /home/b/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

