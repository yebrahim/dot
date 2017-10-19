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

# Reset
Color_Off="\[\033[0m\]"       # Text Reset
PathShort="\w"
NewLine="\n"
# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

export PS1=$Green"[\h]":$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    echo "'$Green'"$(git_branch "(%s)");\
  else \
    echo "'$Red'"$(git_branch "{%s}");\
  fi) '$Cyan'\w'$Color_Off''$NewLine'$ "; \
else \
  echo "$(echo `pwd` | grep "/google/src/cloud/$USER/" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    echo "'$Green'Citc '$Cyan\${PWD#/google/src/cloud/$USER/}$Color_Off'\$ "; \
  else \
    echo "'$Cyan'\w'$Color_Off'\n$ "
  fi)"; \
fi)'

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
alias pushupstream='git push --set-upstream origin $(git_branch)'
alias pull='git pull'
alias commit='git commit -m'
alias amend='git commit --amend'
alias fetch='git fetch'
function st {
  git log --pretty=format:"%h - <%an> %s (%cr)" --date=relative -3 && echo && git status
}
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
  git difftool -y -d $1..$2
}

# grep
function mygrep { grep -rnIi "$1" . --color; }

# grep options
export GREP_COLOR='1;31' # green for matches

# tmux
alias tmux='tmux -2'

# ls colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# prevent accidental session exit when ctrl+d pressed
set -o ignoreeof
