# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# Path to your oh-my-zsh installation.
export ZSH="/home/alonso/.oh-my-zsh"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/games

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(dotenv)

# Homeshick autocomepletions. Debe ir antes de source oh-my-zsh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source $ZSH/oh-my-zsh.sh

# User configuration

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gst='git status -s'
alias gpull='git pull'
alias gp='git push'
alias gf='git fetch'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias glog='git log --oneline --decorate'
alias gtree='git log --graph --oneline --decorate'
alias gcl='git clone'

alias rld='source ~/.zshrc'

# Comando para abrir la configuración personalizada de terminal & snippets vscode
mod () {
  if [[ $# != 0 ]]; then 
    if [[ $1 == "-zsh" ]]; then 
      echo "Abriendo configuración de terminal" && 
      vim ~/.zshrc
    elif [[ $1 == "-code-latex" ]]; then 
      echo "Abriendo configuración de snippets para .latex en vscode" && 
	elif [[ $1 == "-vim" ]]; then 
      echo "Abriendo vimrc" && 
      vim ~/.vimrc
    elif [[ $1 == "-vim-plugins" ]]; then 
      echo "Abriendo plugins de Vim" && 
      vim ~/.vim/plugins.vim
    else 
      echo "Opción desconocida"
    fi 
  else 
    echo "No hay suficientes argumentos \nOpciones: \n\t 1. -zsh \n\t 2. -code-latex" 
  fi
}


# tytex actua como envoltorio para tlmgr
tytex () {
  if [[ $# != 0 ]]; then 
    if [[ $1 == "search" ]]; then 
      tlmgr search --global --file "/$2"
    elif [[ $1 == "install" ]]; then 
      tlmgr install $2
    else
      echo "Opción desconocida"
    fi
  else 
    echo "No hay suficientes argumentos \nOpciones: \n\t 1. search \n\t 2. install"
  fi
}


alias cif='conda install -c conda-forge'


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/alonso/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/alonso/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/alonso/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/alonso/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homeshick para sincronizar configuraciones
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# Ctrl-S to save
# enable control-s and control-q
vim() STTY=-ixon command vim "$@"
