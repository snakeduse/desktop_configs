# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

#Export
export PATH=$HOME/bin:/usr/local/bin:$HOME/.gem/ruby/2.1.0/bin:$PATH
export EDITOR="/usr/bin/nano"
#export TERM="/usr/bin/urxvt"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#Autocomplete
autoload -U compinit promptinit
compinit
promptinit
[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman
setopt CORRECT_ALL
SPROMPT="Ошибка! ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "
setopt autocd
autoload -U incremental-complete-word
zle -N incremental-complete-word
autoload -U insert-files
zle -N insert-files
autoload -U predict-on
zle -N predict-on
zmodload zsh/complist
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# autocomplit
zstyle ':completion:*:*:(^rm):*:*files' ignored-pacodeerns '*?.o' '*?.c~' \
'*?.old' '*?.pro'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Атрибуты доступа для новых файлов
umask 022
# Отключение звукового сигнала
setopt  No_Beep

#Bindings
# Сочетание клавиш в стиле vi
# bindkey -v
# Сочетание клавиш в стиле emacs
bindkey -e
# Стандартные сочетания клавиш emacs
#Ctrl+a     в начало строки
#Ctrl+e     в конец строки
#Ctrl+b     на символ назад
#Ctrl+c     завершить
#Ctrl+f     на символ вперед
#Ctrl+k     удалить до конца строки
#Ctrl+u     удалить все символы слева от курсора до начала строки
#Сtrl+w     удалить символы слева от курсора до начала слова
#Ctrl+t     меняет символ под курсором на предыдущий
#Ctrl+Shift+- отмена
#ALt+l      привести к нижнему регистру
#Alt+u      привести к верхнему регистру
#Alt+C      первая буква заглавная
#Ctrl+l     clear
#Ctrl+p     previous
#Ctrl+n     next
bindkey '\e[3~' delete-char # del
bindkey ';5D' backward-word # ctrl+left
bindkey ';5C' forward-word #ctrl+right
bindkey "^[[H"  beginning-of-line #home
bindkey "^[[F"  end-of-line       #end
bindkey "^[[A"  history-beginning-search-backward #up
bindkey "^[[B"  history-beginning-search-forward  #down

# Aliases
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --colour=auto'
alias sudo='A=`alias` sudo '
alias pacman='sudo pacman'
alias yaourt='sudo yaourt'
alias sc='sudo systemctl'
alias nc='sudo netcfg'
alias df='df -h' #подключенные носители
alias du='du -h --max-depth=1 | sort -h' #размер файлов и папок в директории
alias off_monitor='sleep 1; xset dpms force off' #отправить монитор в спящий режим
alias ping='ping -c3'
alias shutdown='systemctl poweroff'
alias sleep='systemctl suspend'

alias -s {avi,mkv,mpeg,mpg,mov,m2v,mp4,wmv,m4v}=vlc
alias -s {odt,doc,sxw,rtf}=openoffice.org
alias -s {ogg,mp3,wav,wma}=vlc
autoload -U pick-web-browser
alias -s {html,htm}=google-chrome-stable
alias -s sh=sh
alias -s py=python
alias -s {jpg,jpeg,png,gif,icon}=gpicview
alias -s {pdf,djvu}=evince

#  History
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# zsh-syntax-highlighting from AUR
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES=(
        'alias'           'fg=153,bold'
        'builtin'         'fg=153'
        'function'        'fg=166'
        'command'         'fg=153'
        'precommand'      'fg=153, underline'
        'hashed-commands' 'fg=153'
        'path'            'underline'
        'globbing'        'fg=166'
)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Распаковка архивов
# example: extract file
extract () {
    if [ -f $1 ] ; then
	case $1 in
	    *.tar.bz2)   tar xjf $1        ;;
	    *.tar.gz)    tar xzf $1     ;;
	    *.bz2)       bunzip2 $1       ;;
	    *.rar)       unrar x $1     ;;
	    *.gz)        gunzip $1     ;;
	    *.tar)       tar xf $1        ;;
	    *.tbz2)      tar xjf $1      ;;
	    *.tbz)       tar -xjvf $1    ;;
	    *.tgz)       tar xzf $1       ;;
	    *.zip)       unzip $1     ;;
	    *.Z)         uncompress $1  ;;
	    *.7z)        7z x $1    ;;
	    *)           echo "I don't know how to extract '$1'..." ;;
	esac
    else
	echo "'$1' is not a valid file"
    fi
}

# Запаковать архив
# example: pk tar file
pk () {
    if [ $1 ] ; then
	case $1 in
	    tbz)       tar cjvf $2.tar.bz2 $2      ;;
	    tgz)       tar czvf $2.tar.gz  $2       ;;
	    tar)      tar cpvf $2.tar  $2       ;;
	    bz2)    bzip $2 ;;
	    gz)        gzip -c -9 -n $2 > $2.gz ;;
	    zip)       zip -r $2.zip $2   ;;
	    7z)        7z a $2.7z $2    ;;
	    *)         echo "'$1' cannot be packed via pk()" ;;
	esac
    else
	echo "'$1' is not a valid file"
    fi
}

# Using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
