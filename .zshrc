# .zshrc
# zsh settings

export PATH=./:~/bin:~/bin/eclipse:~/bin/mongodb/bin:/opt/local/bin:/opt/local/sbin:~/.rvm/bin:$PATH

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

#Prompt
PS1=$'%{\e[0;32m%}%B%n%b%{\e[1;32m%}@%m %{\e[0m%}$(git_prompt_info) %{\e[0;33m%}%~
%{\e[0m%}%# '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
   function command_not_found_handle {
   # check because c-n-f could've been removed in the meantime
   if [ -x /usr/lib/command-not-found ]; then
      /usr/bin/python /usr/lib/command-not-found -- $1
      return $?
   else
      return 127
   fi
}
fi

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

#use vim settings
bindkey -v

#use shell builtin calculator
autoload -U zcalc


#load other settings

##################
##   COMPLETE   ##
##################
# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if `command -v dircolors > /dev/null`
then
  eval "$(dircolors -b)"
else
  eval "$(gdircolors -b)"
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

##################
##      SET     ##
##################

#activate command correction
setopt CORRECT_ALL  #might want to use CORRECT instead
setopt CORRECT

#add slash after arguments that are directories
setopt AUTO_PARAM_SLASH

#activate autocd
setopt AUTO_CD

#use advanced globbing
setopt EXTENDED_GLOB

#don't save consecutive duplicate commands
setopt HIST_IGNORE_DUPS

#allow shared history across terminals
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

#append history list instead of overwriting
setopt APPEND_HISTORY

#disable background job having lower priority
unsetopt BG_NICE

#put timestamps in history
setopt EXTENDED_HISTORY

#immediately complete command on tab instead of listing all possibilities
setopt MENU_COMPLETE

#immediately display bg jobs info
setopt NOTIFY

##################
##     ALIAS    ##
##################

# aliasing platform specific binaries
if [[ "$(uname)" == "Linux" ]]; then
    alias ls='ls --color=auto'
    alias g="gvim --remote-silent"
    alias open="gnome-open"
elif [[ "$(uname)" == "Darwin" ]]; then
    alias ls='gls --color=auto'
    alias find='gfind'
    alias g="mvim --remote-silent"
fi

## Standard aliases - security
# "-i" asks for confirmation when deleting. This is good.
# In the "dangerous" section there are aliases for non-confirmation.
alias rm='rm -v -i'
alias cp='cp -v -i'
alias mv='mv -v -i'

## Standard aliases - CPM/MSDOS heritage
alias del='rm -v -i'
alias cls='clear'
# "-p" lets you create a path structure with one command, ex. mkdir -p /a/b/c
alias md='mkdir -v -p'
alias rd='rmdir -v'

## Standard aliases - convenience
# To be used as in "cp /etc/inetd.conf /etc/inetd.conf.`today`"
alias today="date '+%d%h%y'"
# Pressing "x" and enter exits.
alias x='exit'
# Quite handy, type "ff test.c" to find "test.c". 
# Keep in mind that there is also "locate test.c" which is faster.
alias ff='find . -name $*'
# Alias for "." and ".."
# Shows current directory
alias .='pwd'
# Goes back one directory
alias ..='cd ..'
alias ../='cd ../'
# Goes back two directories
alias ...='cd ../..'
alias .../='cd ../../'
# Goes to the root directory
alias /='cd /'

alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'
alias up7='cd ../../../../../../..'

## Standard aliases - for typos
# These are the most common typos made by users, even experienced ones.
# Send me yours.
alias maek='make'
alias alais='alias'
alias csl='clear'
alias sl='ls'

#allow grep and less to have color
alias grep='grep --color=auto'
alias less='less -R'

#use less
alias more='less -R'

#use vim
alias vi="vim"

#Standard ls commands
#list all .* files
alias l.='ls -d .*'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'

#aptget
alias ai='sudo apt-get install'

alias gru='git remote update'
alias grm='git rebase origin/master'
alias gittouch='git commit --amend --date="$(date)"'

alias h='history | tail -25'
##################
##   BINDKEY    ##
##################

#from emacs settings
#bindkey "^?" backward-delete-char
#bindkey '^[OH' beginning-of-line
#bindkey '^[OF' end-of-line
#bindkey '^[[5~' up-line-or-history
#bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey "^f" history-incremental-search-forward
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

bindkey ' ' magic-space    # also do history expansion on space
bindkey "jj" vi-cmd-mode   # map jj to go back to command mode

# press v to edit command line with vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#Posgresql settings

export LOCAL_DB=~/postgres
export PGHOST=$LOCAL_DB
export PGDATA=$LOCAL_DB/data

alias startp='pg_ctl -w -l ~/server.log start -o "-c listen_addresses= -c unix_socket_directory=$LOCAL_DB"'
alias stopp='pg_ctl stop'

