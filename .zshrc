# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/ricarte/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="pygmalion"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Add env.sh
#source ~/Projects/config/env.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Personal things, as anything in this file
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias vm='nvim'
alias evim='nvim ~/.config/nvim/init.vim'
alias etmux='nvim ~/.tmux.conf'
alias ezsh='nvim ~/.zshrc'
alias api='cd ~/paperx/paperx_api'
alias core='cd ~/paperx/paperx_core'
alias front='cd ~/paperx/paperx_core/src/app'
alias back='cd ~/paperx/paperx_api/app'
alias data='cd ~/paperx/paperx_data'
alias loonaapp='cd ~/paperx/loona_app'
alias loona='cd ~/paperx/loona_api'
alias elastic='~/Documentos/elasticsearch-5.6.2/bin/elasticsearch'
alias oldelastic='~/Documentos/elasticsearch-5.4.0/bin/elasticsearch'
alias kibana='~/Documentos/kibana-5.6.2-darwin-x86_64/bin/kibana'
alias love='/Applications/love.app/Contents/MacOS/love'
alias comp='cd ~/Documentos/Computação\ 2018.1/'
alias paperx='sh ~/paperx/paperx_cli/paperx-cli'

#MPI aliases
alias mpirun='$HOME/opt/usr/local/bin/mpirun'
alias mpicc='$HOME/opt/usr/local/bin/mpicc'
alias mpic++='$HOME/opt/usr/local/bin/mpic++'

#Extra alias for build
eval "$(rbenv init -)"
alias md5sum='md5 -r'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
