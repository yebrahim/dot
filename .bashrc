# .bashrc file
# By Yasser Elsayed (yasser.ebrahim@gmail.com)
#
# Concepts:
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#    2) .bash_profile is the *login* config for bash, launched upon first connection.
#    3) .bash_profile imports .bashrc, but not vice versa.
#    4) .bashrc imports .bashrc_custom, which can be used to override
#        variables specified here.
#           

# Make prompt informative
#PS1='\e[0;31m\u \w| \e[m'

## -----------------------
## Set up aliases --
## -----------------------

export PS1="\[\033[38;5;2m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]\n$ "

# Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# Nav
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias du='du -h -d=1'
alias ll='ls -Ahl'
alias tree='tree -A -C -L 2'
findfile () {
  find . -iname "*$1*" -print
}

# Git
alias clean='git clean -xdf'
alias clone='git clone'
alias push='git push'
alias pull='git pull'
alias commit='git commit -m'
alias amend='git commit --amend'
alias fetch='git fetch'
alias st='git status'
alias addall='git add -A'
alias br='git branch'
alias co='git checkout'
alias unstage='git reset HEAD'
alias log='git log --pretty=format:"%h - <%an> %s (%cr)" --date=relative -10'
alias stash='git stash save'
alias unstash='git stash pop'
alias stashes='git stash list'
alias pick='git cherry-pick'
alias trackedbranch='git rev-parse --abbrev-ref --symbolic-full-name @{u}'
odd () {
  git difftool -y $1..$2
}

# grep
function mygrep { grep -rnIi "$1" . --color; }

# grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches

# ls colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

