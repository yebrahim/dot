# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

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
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias md='mkdir'
alias du='du -h'
alias ll='ls -Ahl'
alias tree='tree -A -C -L 2'
findfile () {
  find . -iname "*$1*" -print
}

# Git
alias clean='git clean -xdf'
alias clone='git clone'
alias addall='git add -A && git status -s'
alias push='git push'
alias pushupstream='git push --set-upstream origin $(git_branch)'
alias pull='git pull && git status -s'
function commit { git commit -a -m "$*" }
alias amend='git commit --amend'
alias amendall='git add -A && git commit --amend --no-edit -n'
alias fetch='git fetch && git status -s'
alias rebasemain='git fetch && git rebase origin/main; git status -s'
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
alias br='git branch -vv'
alias co='git checkout'
alias unstage='git reset HEAD'
alias log='git log --pretty=format:"%h - <%an> %s (%cr)" --date=relative -10 $@'
alias logsince='git rev-list head --not $@'
alias mylog='git log --pretty=format:"%h - <%an> %s (%cr)" --date=relative -10 --author=yasser.elsayed'
alias stash='git stash save'
alias unstash='git stash pop'
alias stashes='git stash list'
alias pick='git cherry-pick'
alias trackedbranch='git rev-parse --abbrev-ref --symbolic-full-name @{u}'
alias grpcui='grpcui -plaintext localhost:50051'
odd () {
  git difftool -y -d $1..$2
}

function untilfail {
  while "$@"; do :; done
}

# grep
function mygrep { grep -rnIi "$1" . --color; $@ }

# grep options
export GREP_COLOR='1;31' # green for matches

# tmux
alias tmux='tmux -2'

# ls colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# prevent accidental session exit when ctrl+d pressed
set -o ignoreeof

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}]"
