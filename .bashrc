# .bashrc file
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

set +x

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# Nav
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias du='du -h --summarize'
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
alias fetch='git fetch && git status'
function colored-git-status {
  for i in `git diff --name-status`
  do
    if  grep -q "^M" <<< "$i"
    then
      echo -e -n "$i$Yellow  "
    elif  grep -q "^D" <<< "$i"
    then
      echo -e -n "$i$Red  "
    else
      echo -e "$i$Color_Off"
    fi
  done
}
function st {
  git status | sed -n '/Your/,/^$/p'
  git status -s && echo
  git log --pretty=format:"%h - <%an> %s (%cr)" --date=relative -3 && echo
}
alias addall='git add -A'
alias br='git branch -vv'
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

function untilfail {
  while "$@"; do :; done
}

# bazel
alias bzltest='bazel test --test_output=all --nocache_test_results'

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

# bash completion
. ~/.git-completion.bash

export EDITOR=vim
export VISUAL="$EDITOR"

export JAVA_HOME=/usr/local/lib/java/Contents/Home

[ -s "/Users/yasser.elsayed/.jabba/jabba.sh" ] && source "/Users/yasser.elsayed/.jabba/jabba.sh"

# Make prompt informative
if test -f ~/.ps1.sh; then
  source ~/.ps1.sh
else
  #Reset
  Color_Off="\[\033[0m"       # Text Reset
  PathShort="\w"
  NewLine="\n"
  # Regular Colors
  Black="\[\e[0;30m\]"
  Red="\[\e[0;31m\]"
  Green="\[\e[0;32m\]"
  Yellow="\[\e[0;33m\]"
  Blue="\[\e[0;34m\]"
  Purple="\[\e[0;35m\]"
  Cyan="\[\e[0;36m\]"
  White="\[\e[0;37m\]"
  GrayBG="\[\033[44m\]"

  export PS1=$GrayBG$Green"[\h]":$Color_Off'$(git branch &>/dev/null;\
  if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
      echo "'$Green'"\($(git_branch "(%s)")\);\
    else \
      echo "'$Red'"$(git_branch "{%s}");\
    fi) '$Cyan'\w'$Color_Off''$NewLine''$Red'▶ '$Color_Off'"; \
  fi)'
fi

# k8s
alias k="kubectl $@"
alias kdesc="kubectl describe pod $@"
alias klogs="kubectl logs -f $@"
alias kpod="kubectl get pods $@ --sort-by=.metadata.creationTimestamp"
alias kdel="kubectl delete pod $@"
alias kexec="kubectl exec -it $@ /bin/bash"
